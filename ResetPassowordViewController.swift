//
//  ResetPassowordViewController.swift
//  HW#28_passWordSecurityCheck
//
//  Created by Dawei Hao on 2023/6/9.
//

import UIKit

class ResetPassowordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var resetPasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newPasswordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        customTextField()
        
        
    }
    
    func customTextField () {
        //newPasswordTextField
        newPasswordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        newPasswordTextField.layer.cornerRadius = 10
        newPasswordTextField.clipsToBounds = true
        newPasswordTextField.layer.borderColor = UIColor.gray.cgColor
        newPasswordTextField.backgroundColor = UIColor(red: 247/255, green: 248/255, blue: 249/255, alpha: 1)
        
        let newPasswordPlaceholderText = " New Password"
        newPasswordTextField.attributedPlaceholder = NSAttributedString(string: newPasswordPlaceholderText, attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 131/255, green: 145/255, blue: 161/255, alpha: 1)])
        
        //confirmPasswordTextField
        confirmPasswordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        confirmPasswordTextField.layer.cornerRadius = 10
        confirmPasswordTextField.clipsToBounds = true
        confirmPasswordTextField.layer.borderColor = UIColor.gray.cgColor
        confirmPasswordTextField.backgroundColor = UIColor(red: 247/255, green: 248/255, blue: 249/255, alpha: 1)
        
        let confirmPasswordPlaceholderText = " Confirm Password"
        confirmPasswordTextField.attributedPlaceholder = NSAttributedString(string: confirmPasswordPlaceholderText, attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 131/255, green: 145/255, blue: 161/255, alpha: 1)])
    }
    
    
    
    
    
    
}
