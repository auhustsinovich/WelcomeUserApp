//
//  ViewController.swift
//  WelcomeUserApp
//
//  Created by Daniil on 8.03.22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    private let userLogin = "User"
    private let userPass = "password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userWelcomeLabel = userName.text
    }
    
    @IBAction func loginButtonPressed() {
        
        guard
            userName.text == userLogin,
            userPassword.text == userPass
        else {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password")
            return
        }
    }
    
    @IBAction func forgotNameButtonPressed() {
        showAlert(title: "Oops!", message: "Your name is \(userLogin) 😉")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(title: "Oops!", message: "Your password is \(userPass) 😉")
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
       
        userName.text = nil
        userPassword.text = nil
        userName.becomeFirstResponder()
    }
}

extension LoginViewController {
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            self.userPassword.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userName {
            userPassword.becomeFirstResponder()
        } else {
            loginButtonPressed()
            performSegue(withIdentifier: "showUserWelcome", sender: nil)
        }
        return true
    }
}
