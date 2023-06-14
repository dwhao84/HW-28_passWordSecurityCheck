//
//  WelcomeViewController.swift
//  HW#28_passWordSecurityCheck
//
//  Created by Dawei Hao on 2023/6/5.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var asAGuestLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customRegisterButton ()
        
    }
    
    func customRegisterButton () {
        registerButton.layer.borderWidth = 1
        registerButton.layer.borderColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1).cgColor
        registerButton.layer.cornerRadius = 8
        registerButton.clipsToBounds = true
        view.addSubview(registerButton)
    }

}
