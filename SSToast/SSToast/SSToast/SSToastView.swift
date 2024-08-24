//
//  SSToastView.swift
//  SSToast
//
//  Created by Sejal Guna on 23/08/24.
//

import UIKit

class SSToastView: UIView {
    private var style: SSToastStyle
    private var message: String
    var onCancelTapped: (() -> Void)?

    init(style: SSToastStyle, message: String, onCancelTapped: (() -> Void)? = nil) {
        self.style = style
        self.message = message
        self.onCancelTapped = onCancelTapped
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = style.themeColor.cgColor
        alpha = 0  // Start as invisible for animation purposes

        let iconImageView = UIImageView(image: UIImage(systemName: style.iconFileName))
        iconImageView.tintColor = style.themeColor
        iconImageView.translatesAutoresizingMaskIntoConstraints = false

        let messageLabel = UILabel()
        messageLabel.text = message
        messageLabel.textColor = .label
        messageLabel.numberOfLines = 0  // Allow multiline text
        messageLabel.lineBreakMode = .byWordWrapping
        messageLabel.translatesAutoresizingMaskIntoConstraints = false

        let cancelButton = UIButton(type: .system)
        cancelButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        cancelButton.tintColor = style.themeColor
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false

        // Create a stack view for icon and message
        let stackView = UIStackView(arrangedSubviews: [iconImageView, messageLabel])
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)
        addSubview(cancelButton)

        setupConstraints(stackView: stackView, cancelButton: cancelButton, iconImageView: iconImageView, messageLabel: messageLabel)
    }

    private func setupConstraints(stackView: UIStackView, cancelButton: UIButton, iconImageView: UIImageView, messageLabel: UILabel) {
        let screenWidth = UIScreen.main.bounds.width
        let toastWidth = screenWidth - 40  // Calculate width based on screen width with a 20-point margin on each side

        NSLayoutConstraint.activate([
            // Constraints for stack view
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            stackView.trailingAnchor.constraint(equalTo: cancelButton.leadingAnchor, constant: -12),
            
            // Ensure icon size
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 20),

            // Constraints for cancel button
            cancelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            cancelButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            cancelButton.widthAnchor.constraint(equalToConstant: 20),
            cancelButton.heightAnchor.constraint(equalToConstant: 20),

            // Toast view constraints
            widthAnchor.constraint(equalToConstant: toastWidth),  // Set width to screen width minus 40 points
            heightAnchor.constraint(greaterThanOrEqualToConstant: 44)  // Minimum height
        ])
    }

    @objc private func cancelButtonTapped() {
        onCancelTapped?()
    }
}
