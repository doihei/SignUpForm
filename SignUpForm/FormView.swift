//
//  FormView.swift
//  SignUpForm
//
//  Created by doi on 2019/07/31.
//  Copyright © 2019 doi. All rights reserved.
//

import Reusable
import RxCocoa
import RxSwift
import UIKit

final class FormView: UIView, NibOwnerLoadable {
    
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    
    @IBOutlet fileprivate weak var textField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNibContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNibContent()
    }
}

// MARK: - Reactive Extension
extension Reactive where Base: FormView {
    
    var type: Binder<FormType> {
        return Binder(base) { view, type in
            view.titleLabel.text = type.title
            view.textField.keyboardType = type.keyboardType
            view.textField.isSecureTextEntry = type.isSecureTextEntry
            view.textField.textContentType = type.textContentType
        }
    }
    
    var textFieldText: ControlProperty<String?> {
        return base.textField.rx.text
    }
}
