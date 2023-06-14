//
//  ForgetPasswordViewController.swift
//  HW#28_passWordSecurityCheck
//
//  Created by Dawei Hao on 2023/6/6.
//

import UIKit

class ForgetPasswordViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var sendCodeButton: UIButton!
    
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var rememberPasswordLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailAddressTextField.delegate = self
        
        customTextField()
        
    }
    
    func customTextField() {
        emailAddressTextField.borderStyle = UITextField.BorderStyle.roundedRect
        emailAddressTextField.layer.cornerRadius = 10
        emailAddressTextField.clipsToBounds = true
        emailAddressTextField.layer.borderColor = UIColor.gray.cgColor
        emailAddressTextField.backgroundColor = UIColor(red: 247/255, green: 248/255, blue: 249/255, alpha:1)
        emailAddressTextField.placeholder = "Enter your email"
    }
  
    
}

