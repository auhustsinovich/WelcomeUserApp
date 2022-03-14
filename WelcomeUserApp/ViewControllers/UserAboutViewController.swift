//
//  UserAboutViewController.swift
//  WelcomeUserApp
//
//  Created by Daniil on 13.03.22.
//

import UIKit

class UserAboutViewController: UIViewController {
 
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personSurname: UILabel!
    @IBOutlet weak var personAge: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = user.person.fullname
        personName.text = user.person.name
        personSurname.text = user.person.surname
        personAge.text = String(user.person.age)
    }
}
