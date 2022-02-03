//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    let alert = ErrorMessage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alert.delegate = self
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        guard let email = emailTextfield.text, let password = passwordTextfield.text else {
            alert.show("Enter login or password", "Enter your login and password")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let err = error {
                self?.alert.show("Auth Error", err)
            } else {
                strongSelf.performSegue(withIdentifier: K.chatId, sender: self)
            }
        })
    }
    
}
