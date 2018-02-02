//
//  ViewController.swift
//  MVVMLoginSystem
//
//  Created by Aashish Adhikari on 2/1/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var txtuserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblEnable: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Binding the View to ViewModel
        _ = txtuserName.rx.text.map { $0 ?? "" }.bind(to: viewModel.emailText)
        _ = txtPassword.rx.text.map { $0 ?? "" }.bind(to: viewModel.passwordText)
        
        _ = viewModel.isValid.bind(to: btnLogin.rx.isEnabled)
        
        _ = viewModel.isValid.subscribe(onNext: { [weak self] isValid in
                self!.lblEnable.text = isValid ? "Enable" : "Not Enable"
                self?.lblEnable.textColor = isValid ? .green : .red
                print("isValid \(isValid)")
            }, onError: nil, onCompleted: nil, onDisposed: nil)

    }
    
    @IBAction func btnClicked(_ sender: UIButton) {
    }
    
}

