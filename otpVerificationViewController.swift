//
//  otpVerificationViewController.swift
//  HW#28_passWordSecurityCheck
//
//  Created by Dawei Hao on 2023/6/6.
//

import UIKit

class otpVerificationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var otpVerificationLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var verifyButton: UIButton!
    
    @IBOutlet weak var passwordOneTextField: UITextField!
    @IBOutlet weak var passwordTwoTextField: UITextField!
    @IBOutlet weak var passcodeThreeTextField: UITextField!
    @IBOutlet weak var passcodeFourTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordOneTextField.delegate = self
        passwordTwoTextField.delegate = self
        passcodeThreeTextField.delegate = self
        passcodeFourTextField.delegate = self
        
        customPasswordTextField()
    }
    
    func textField(_ passwordOneTextField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = passwordOneTextField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        //允許輸入的數字數量為1
        return updatedText.count <= 1
    }
    
    
    func customPasswordTextField () {
        //passwordOne
        passwordOneTextField.borderStyle = .roundedRect
        passwordOneTextField.layer.cornerRadius = 10
        passwordOneTextField.clipsToBounds = true
        passwordOneTextField.layer.borderColor = UIColor.gray.cgColor
        passwordOneTextField.layer.borderWidth = 2
        passwordOneTextField.layer.borderColor = UIColor(red: 53/255, green: 194/255, blue: 193/255, alpha: 1).cgColor
        passwordOneTextField.textAlignment = .center
        
        //passwordTwo
        passwordTwoTextField.borderStyle = .roundedRect
        passwordTwoTextField.layer.cornerRadius = 10
        passwordTwoTextField.clipsToBounds = true
        passwordTwoTextField.layer.borderColor = UIColor.gray.cgColor
        passwordTwoTextField.layer.borderWidth = 2
        passwordTwoTextField.layer.borderColor = UIColor(red: 53/255, green: 194/255, blue: 193/255, alpha: 1).cgColor
        passwordTwoTextField.textAlignment = .center
        
        //passwordThree
        passcodeThreeTextField.borderStyle = .roundedRect
        passcodeThreeTextField.layer.cornerRadius = 10
        passcodeThreeTextField.clipsToBounds = true
        passcodeThreeTextField.layer.borderColor = UIColor.gray.cgColor
        passcodeThreeTextField.layer.borderWidth = 2
        passcodeThreeTextField.layer.borderColor = UIColor(red: 53/255, green: 194/255, blue: 193/255, alpha: 1).cgColor
        passcodeThreeTextField.textAlignment = .center
        
        //passwordFour
        passcodeFourTextField.borderStyle = .roundedRect
        passcodeFourTextField.layer.cornerRadius = 10
        passcodeFourTextField.clipsToBounds = true
        passcodeFourTextField.layer.borderColor = UIColor.gray.cgColor
        passcodeFourTextField.layer.borderWidth = 2
        passcodeFourTextField.layer.borderColor = UIColor(red: 53/255, green: 194/255, blue: 193/255, alpha: 1).cgColor
        passcodeFourTextField.textAlignment = .center
    }
    
}
