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
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        func createAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
                alert.dismiss(animated: true, completion: nil)
            }))
                
                self.present(alert, animated: true, completion: nil)
        }
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    createAlert(title: "Error", message: "Password must be at least 6 characters")
                    print(e.localizedDescription)
                    //localizedDescription uses users' phone language
                } else {
                    //Navigate to Chat View Controller
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
    
    
    
    
    }
    
}
