//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    let alert = ErrorMessage()
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        alert.delegate = self
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password, completion: { authResult, error in
                if let err = error {
                    print("Error Auth: ", err.localizedDescription)
                    self.alert.show("Wrong Password", err)
                } else {
                    self.performSegue(withIdentifier: K.chatId, sender: self)
                }
            })
        } else {
            print("Error text typing")
        }
    }
}
