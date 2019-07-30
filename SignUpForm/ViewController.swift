//
//  ViewController.swift
//  LoginForm
//
//  Created by doi on 2019/07/30.
//  Copyright © 2019 doi. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var emailTextField: UITextField!
    
    @IBOutlet private weak var passwordTextField: UITextField!
    
    @IBOutlet private weak var submitButton: SubmitButton!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Observable
            .combineLatest(emailTextField.rx.text.orEmpty.asObservable(), passwordTextField.rx.text.orEmpty.asObservable()) { email, password in
                email.isValidEmail() && password.isValidPassword()
            }
            .bind(to: submitButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
}
