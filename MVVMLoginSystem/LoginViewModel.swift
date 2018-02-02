//
//  LoginViewModel.swift
//  MVVMLoginSystem
//
//  Created by Aashish Adhikari on 2/1/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import Foundation
import RxSwift

// LoginView Model

struct LoginViewModel{
    
    var emailText = Variable<String>("")
    var passwordText = Variable<String>("")

    var isValid: Observable<Bool>{
        return Observable.combineLatest(emailText.asObservable(),
                                        passwordText.asObservable()) { email, password in
            
            //Here is main login
            email.count >= 3 && password.count >= 3
        }
    }
}

