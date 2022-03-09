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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userWelcomeLabel = "Welcome, \(userName.text ?? "")!"
    }
    
    @IBAction func loginButtonPressed() {
        
        guard
            userName.text == "User",
            userPassword.text == "Password"
        else {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password")
            return
        }
    }
    
    @IBAction func forgotNameButtonPressed() {
        showAlert(title: "Oops!", message: "Your name is User 😉")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(title: "Oops!", message: "Your password is Password 😉")
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.source is WelcomeViewController else { return }
        userName.text = nil
        userPassword.text = nil
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
