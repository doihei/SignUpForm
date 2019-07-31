//
//  FormType.swift
//  SignUpForm
//
//  Created by doi on 2019/07/31.
//  Copyright © 2019 doi. All rights reserved.
//

import UIKit

enum FormType: Int, CaseIterable {
    case username
    case email
    case password
    case confirmPassword
    
    var title: String {
        switch self {
        case .username:
            return "username"
        case .email:
            return "email"
        case .password:
            return "password"
        case .confirmPassword:
            return "confirm password"
        }
    }
    
    var keyboardType: UIKeyboardType {
        switch self {
        case .email:
            return .emailAddress
        case .username, .password, .confirmPassword:
            return .asciiCapable
        }
    }
    
    var isSecureTextEntry: Bool {
        switch self {
        case .username, .email:
            return false
        case .password, .confirmPassword:
            return true
        }
    }
    
    var textContentType: UITextContentType {
        switch self {
        case .username:
            return .username
        case .email:
            return .emailAddress
        case .password:
            return .newPassword
        case .confirmPassword:
            return .password
        }
    }
}
