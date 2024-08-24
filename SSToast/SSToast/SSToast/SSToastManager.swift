//
//  SSToastManager.swift
//  SSToast

//
//  Created by Sejal Guna on 23/08/24.
//

import UIKit

class SSToastManager {
    static let shared = SSToastManager()

    private var toastViews: [SSToastView] = []
    private let maxToasts: Int = 3 // Maximum number of toasts to display at once

    func show(toast: SSToast) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            
            // Create and configure the toast view
            let toastView = SSToastView(
                style: toast.style,
                message: toast.message
            )
            
            // Handle cancel button action
            toastView.onCancelTapped = { [weak self] in
                self?.hideToast(toastView: toastView)
            }
            
            // Add the toast view to the window
            guard let window = UIApplication.shared.windows.first(where: \.isKeyWindow) else { return }
            window.addSubview(toastView)
            
            // Configure the toast view layout
            toastView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                toastView.centerXAnchor.constraint(equalTo: window.centerXAnchor),
                toastView.bottomAnchor.constraint(equalTo: window.safeAreaLayoutGuide.bottomAnchor, constant: -16)
            ])
            
            // Animate the appearance of the toast view
            self.animateToastAppearance(toastView: toastView, duration: toast.duration)
            
            // Manage the list of toasts
            self.toastViews.append(toastView)
            if self.toastViews.count > self.maxToasts {
                self.hideToast(toastView: self.toastViews.first!)
            }
        }
    }

    private func animateToastAppearance(toastView: SSToastView, duration: TimeInterval) {
        toastView.alpha = 0
        UIView.animate(withDuration: 0.3, animations: {
            toastView.alpha = 1
        }) { [weak self] _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                self?.hideToast(toastView: toastView)
            }
        }
    }

    private func hideToast(toastView: SSToastView) {
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 0.3, animations: {
                toastView.alpha = 0
            }) { [weak self] _ in
                toastView.removeFromSuperview()
                self?.toastViews.removeAll { $0 == toastView }
            }
        }
    }
}
