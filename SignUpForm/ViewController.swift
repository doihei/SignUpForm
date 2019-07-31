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

    @IBOutlet private weak var usernameFormView: FormView!
    
    @IBOutlet private weak var emailFormView: FormView!
    
    @IBOutlet private weak var passwordFormView: FormView!
    
    @IBOutlet private weak var confirmPasswordFormView: FormView!
    
    @IBOutlet private weak var submitButton: SubmitButton!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        bind()
    }
    
    private func setup() {
        Observable.just(.username).bind(to: usernameFormView.rx.type).disposed(by: disposeBag)
        Observable.just(.email).bind(to: emailFormView.rx.type).disposed(by: disposeBag)
        Observable.just(.password).bind(to: passwordFormView.rx.type).disposed(by: disposeBag)
        Observable.just(.confirmPassword).bind(to: confirmPasswordFormView.rx.type).disposed(by: disposeBag)
    }
    
    private func bind() {
        
        Observable
            .combineLatest(
                usernameFormView.rx.textFieldText.orEmpty,
                emailFormView.rx.textFieldText.orEmpty,
                passwordFormView.rx.textFieldText.orEmpty,
                confirmPasswordFormView.rx.textFieldText.orEmpty
            ) { username, email, password, confirmPassword in
                username.isValidUsername() && email.isValidEmail() && password.isValidPassword() && (password == confirmPassword)
            }
            .bind(to: submitButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
}
