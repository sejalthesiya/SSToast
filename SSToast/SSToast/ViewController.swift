//
//  ViewController.swift
//  SSToast
//
//  Created by Sejal Guna on 23/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    private func setupButtons() {
        let showErrorToastButton = createButton(withTitle: "Show Error Toast", action: #selector(showErrorToast))
        let showWarningToastButton = createButton(withTitle: "Show Warning Toast", action: #selector(showWarningToast))
        let showSuccessToastButton = createButton(withTitle: "Show Success Toast", action: #selector(showSuccessToast))
        let showInfoToastButton = createButton(withTitle: "Show Info Toast", action: #selector(showInfoToast))
        
        let stackView = UIStackView(arrangedSubviews: [showErrorToastButton, showWarningToastButton, showSuccessToastButton, showInfoToastButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func createButton(withTitle title: String, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 250).isActive = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 4
        return button
    }
    
    @objc private func showErrorToast() {
        let toast = SSToast(style: .error, message: "This is an error message!")
        SSToastManager.shared.show(toast: toast)
    }
    
    @objc private func showWarningToast() {
        let toast = SSToast(style: .warning, message: "This is a warning message!")
        SSToastManager.shared.show(toast: toast)
    }
    
    @objc private func showSuccessToast() {
        let toast = SSToast(style: .success, message: "This is a success message!")
        SSToastManager.shared.show(toast: toast)
    }
    
    @objc private func showInfoToast() {
        let toast = SSToast(style: .info, message: "This is an info message!")
        SSToastManager.shared.show(toast: toast)
    }
}
