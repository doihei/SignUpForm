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

        let username = usernameFormView.rx.textFieldText.orEmpty.share(replay: 1)
        let email = emailFormView.rx.textFieldText.orEmpty.share(replay: 1)
        let password = passwordFormView.rx.textFieldText.orEmpty.share(replay: 1)
        let confirmPassword = confirmPasswordFormView.rx.textFieldText.orEmpty.share(replay: 1)
        
        username
            .filter { !$0.isEmpty }
            .map { $0.isValidUsername() }
            .bind(to: usernameFormView.rx.isCautionLabelHidden)
            .disposed(by: disposeBag)
        
        email
            .filter { !$0.isEmpty }
            .map { $0.isValidEmail() }
            .bind(to: emailFormView.rx.isCautionLabelHidden)
            .disposed(by: disposeBag)
        
        password
            .filter { !$0.isEmpty }
            .map { $0.isValidPassword() }
            .bind(to: passwordFormView.rx.isCautionLabelHidden)
            .disposed(by: disposeBag)
        
        Observable
            .combineLatest(password, confirmPassword) { password, confirmPassword in
                password == confirmPassword
            }
            .bind(to: confirmPasswordFormView.rx.isCautionLabelHidden)
            .disposed(by: disposeBag)
        
        Observable
            .combineLatest(username, email, password, confirmPassword) { username, email, password, confirmPassword in
                 username.isValidUsername() && email.isValidEmail() && password.isValidPassword() && (password == confirmPassword)
            }
            .bind(to: submitButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
}
