//
//  SubmitButton.swift
//  LoginForm
//
//  Created by doi on 2019/07/30.
//  Copyright © 2019 doi. All rights reserved.
//

import UIKit

final class SubmitButton: UIButton {

    override var isEnabled: Bool {
        willSet {
            backgroundColor = newValue ? .blue : .lightGray
        }
    }
}
