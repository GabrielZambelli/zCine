//
//  LoginViewController.swift
//  moviesIsHere
//
//  Created by Gabriel Zambelli on 09/07/20.
//  Copyright © 2020 Gabriel Zambelli. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: -- Attributes
    var coordinator: Login?
    var loginViewModel: LoginViewModel?
    
    //MARK: -- IBOutlet
    
    @IBOutlet weak var tfUser: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    //MARK: -- IBAction
    
    
    @IBAction func login(_ sender: Any) {
        hideKeyboar()
        guard let user = tfUser.text, let password = tfPassword.text else { return }
        loginViewModel?.validLogin(userName: user, password: password)
    }
    
    
    //MARK: -- View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfUser.delegate = self
        tfPassword.delegate = self
        
        tfUser.addHideKeyboard(selector: #selector(hideKeyboar))
        tfPassword.addHideKeyboard(selector: #selector(hideKeyboar))
    }
    
    //MARK: Method

    
    @objc func hideKeyboar(){
        self.view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case tfUser:
            tfPassword.becomeFirstResponder()
        default:
            login(self)
        }
        return true
    }
}


extension LoginViewController: LoginModel{
    
    func failedLogin(_ error: ZcineError) {
        //To do Failed
    }
    
    func didLogin() {
        
        coordinator?.didLogin()
        
    }
}
