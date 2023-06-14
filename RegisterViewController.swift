//
//  RegisterViewController.swift
//  HW#28_passWordSecurityCheck
//
//  Created by Dawei Hao on 2023/6/5.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var appleIconButton: UIButton!
    @IBOutlet weak var googleIconButton: UIButton!
    @IBOutlet weak var metaIconButton: UIButton!
    
    @IBOutlet weak var orLoginWithLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        customTitleLabel()
        
        addFirstLine()
        addSecondLine()
        
        customPlaceholderUI()
        customTextFieldStyle()

    }
    
    //add left side of line for OrLoginWith
    func addFirstLine() {
        let lineView = UIView(frame: CGRect(x: 31, y: 663.5, width: 100, height: 1))
        lineView.layer.borderWidth = 1.0
        lineView.layer.borderColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1).cgColor
        self.view.addSubview(lineView)
    }
    
    //add right side of line for OrLoginWith
    func addSecondLine() {
        let secondLineView = UIView(frame: CGRect(x: 261, y: 663.5, width: 100, height: 1))
        secondLineView.layer.borderWidth = 1.0
        secondLineView.layer.borderColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1).cgColor
        self.view.addSubview(secondLineView)
    }
    //Set up titleLabel
    func customTitleLabel() {
        titleLabel.textColor = UIColor(red: 30/255, green: 35/255, blue: 44/255, alpha: 1)
        titleLabel.frame = CGRect(x: 31, y: 145, width: 330, height: 100)
        titleLabel.text = "Welcome back! \nGlad to see you, Again!"
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    //Set up placeholder
    func customPlaceholderUI() {
        //usernameTextField placeholder
        let placeholderText = " Username"
        userNameTextField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 131/255, green: 145/255, blue: 161/255, alpha: 1)])
       
        //emailTextField placeholder
        let secondPlaceholderText = " Email"
        emailTextField.attributedPlaceholder = NSAttributedString(string: secondPlaceholderText, attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 131/255, green: 145/255, blue: 161/255, alpha: 1)])
        
        //passwordTextField placeholder
        let thirdPlaceholderText = " Password"
        passwordTextField.attributedPlaceholder = NSAttributedString(string: thirdPlaceholderText, attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 131/255, green: 145/255, blue: 161/255, alpha: 1)])
        
        //confirmPasswordTextField placeholder
        let fourthPlaceholderText = " Confirm password"
        confirmPasswordTextField.attributedPlaceholder = NSAttributedString(string: fourthPlaceholderText, attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 131/255, green: 145/255, blue: 161/255, alpha: 1)])
    }
    
    func customTextFieldStyle() {
        //usernameTextField
        userNameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        userNameTextField.layer.cornerRadius = 10
        userNameTextField.clipsToBounds = true
        userNameTextField.layer.borderColor = UIColor.gray.cgColor
        userNameTextField.backgroundColor = UIColor(red: 247/255, green: 248/255, blue: 249/255, alpha: 1)
        
        //emailTextField
        emailTextField.borderStyle = UITextField.BorderStyle.roundedRect
        emailTextField.layer.cornerRadius = 10
        emailTextField.clipsToBounds = true
        emailTextField.layer.borderColor = UIColor.gray.cgColor
        emailTextField.backgroundColor = UIColor(red: 247/255, green: 248/255, blue: 249/255, alpha: 1)
        
        //passwordTextField
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.clipsToBounds = true
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        passwordTextField.backgroundColor = UIColor(red: 247/255, green: 248/255, blue: 249/255, alpha: 1)
        
        //confirmPasswordTextField
        confirmPasswordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        confirmPasswordTextField.layer.cornerRadius = 10
        confirmPasswordTextField.clipsToBounds = true
        confirmPasswordTextField.layer.borderColor = UIColor.gray.cgColor
        confirmPasswordTextField.backgroundColor = UIColor(red: 247/255, green: 248/255, blue: 249/255, alpha: 1)
    }
}
