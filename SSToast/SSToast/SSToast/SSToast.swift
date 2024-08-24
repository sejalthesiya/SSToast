//
//  SSToast.swift
//  SSToast
//
//  Created by Sejal Guna on 23/08/24.
//

import Foundation
import UIKit

struct SSToast {
    var style: SSToastStyle
    var message: String
    var duration: TimeInterval = 2
}

enum SSToastStyle {
    case error
    case warning
    case success
    case info
    
    var themeColor: UIColor {
        switch self {
        case .error: return .red
        case .warning: return .orange
        case .info: return .blue
        case .success: return .green
        }
    }
    
    var iconFileName: String {
        switch self {
        case .info: return "info.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .success: return "checkmark.circle.fill"
        case .error: return "xmark.circle.fill"
        }
    }
}
