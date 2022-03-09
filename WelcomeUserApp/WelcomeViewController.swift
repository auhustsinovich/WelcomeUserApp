//
//  WelcomeViewController.swift
//  WelcomeUserApp
//
//  Created by Daniil on 9.03.22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var userWelcomeLabel: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = userWelcomeLabel
    }
}
