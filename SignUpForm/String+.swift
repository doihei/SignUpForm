//
//  String+.swift
//  LoginForm
//
//  Created by doi on 2019/07/30.
//  Copyright © 2019 doi. All rights reserved.
//

import Foundation

extension String {
    
    func isValidEmail() -> Bool {
        return NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}").evaluate(with: self)
    }
    
    func isValidUsername() -> Bool {
        return NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z]+").evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        return NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z]+").evaluate(with: self)
    }
    
//    func isValidUsername() -> Bool {
//        return NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z]{7,}").evaluate(with: self)
//    }
//
//    func isValidPassword() -> Bool {
//        return NSPredicate(format:"SELF MATCHES %@", "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$").evaluate(with: self)
//    }
}
