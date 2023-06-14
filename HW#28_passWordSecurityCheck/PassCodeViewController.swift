//
//  PassCodeViewController.swift
//  HW#28_passWordSecurityCheck
//
//  Created by Dawei Hao on 2023/6/4.
//
/* Password Security
 
 Passwords like "abcdef" or "123qwe" or "password" may be easy to remember, but they only provide an illusion of security. Hackers are ever more sophisticated in their attacks, so you should be careful to select a password that can't be guessed easily.

 Imagine that you've created a new app that requires users to sign up for an account. When they sign up, they have to choose an account password. You want your users to have a secure passwords, so you'll use this playground to develop an algorithm that rejects insecure passwords.

 The first step is to ensure that the user hasn't chosen one of the most commonly used passwords, which hackers are sure to try first. It's the easiest way to get into somebody's account, since it doesn't require a sophisticated algorithm to make a guess.

 The array below contains ten commonly used passwords.*/
/*Checking for Characters
 
 Now that you're eliminating the most common passwords, you can add some more sophisticated checks to your algorithm. A good policy is to disallow plain dictionary words. If you require the user to include nonalphabetic characters, there'll be some amount of randomness even if the password includes dictionary words (such as "apple1984"). You might also require passwords be a minimum length. The longer a password, the longer it takes for a hacker to try all possibilities. For example, there are only 140,608 simple six-letter passwords. In contrast, the number of 16-character passwords generated according to the rules below has an upper bound of over 30 nonillion, or 30 thousand billion billion billion! That's way too many for a hacker to perform an exhaustive search of possible passwords.

 Use the following rules:

 At least 16 characters
 At least one regular letter
 At least one digit
 At least one punctuation character

 The two new arrays below contain the digits and common punctuation characters. Use them in your algorithm.*/

import UIKit
class PassCodeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var orLoginWithLabel: UILabel!
    @IBOutlet weak var didNotHaveAnAccountLabel: UILabel!
    @IBOutlet weak var registerNowLabel: UILabel!
    @IBOutlet weak var loginStautsLabel: UILabel!
    @IBOutlet weak var accountStatusLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var facebookLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    @IBOutlet weak var showPasswordButton: UIButton!
    
    @IBOutlet weak var accountLoginStatusImageView: UIImageView!
    
    @IBOutlet weak var passwordLoginStatusImageView: UIImageView!
    
    
    var showPasswordButtonCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up UITextField delegate
        accountTextField.delegate = self
        passWordTextField.delegate = self
        
        //customTextFieldStyle
        customTextFieldStyle()
        
        //add left side of line for OrLoginWith
        addLine()
        
        //custom placeholder
        customPlaceholderUI()
        
        //custom titleLabel
        customTitleLabel()
        
        passWordTextField.isSecureTextEntry = true
        
        showPasswordButton.isHidden = true
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToNextPage" {
            _ = segue.destination as! LoginSuccessViewController
        }
    }
    /*
     建立使用者名稱
     如果您在註冊 Google 帳戶或 Gmail 時看到「系統不允許使用這個使用者名稱」，請按照下列指南操作。
     字元長度
     選擇長度為 6 到 30 個字元的使用者名稱。使用者名稱可以是任何字母、數字或符號的組合。
     特殊字元
     使用者名稱可以包含英文字母 (a-z)、數字 (0-9) 和半形句號 (.)。
     使用者名稱不能包含 AND 符號 (&)、等號 (=)、底線 (_)、單引號 (')、破折號 (-)、加號 (+)、半形逗號 (,)、角括號 (<、>) 或是連續使用半形句號 (.)。
     &=_'-+,<>.
     使用者名稱的開頭和結尾皆可使用非英數字元，但不得使用半形句號 (.)。除此規則外，半形句號 (.) 對 Gmail 地址沒有影響。
     如需進一步瞭解如何變更使用者名稱，請按這裡前往說明中心。
     */

    enum AccountCheck {
        case valid
        case lackWord
        case lackDigits
        case lackCorrection
        case lackAccountTextLength
        case empty
    }
    
    enum PasswordCheck {
        case valid
        case containsCommonPassword
        case lacksDigits
        case lacksPunctuation
        case lackTextLength
        case empty
    }
    
    func checkAccountCorrection (_ account: String) -> AccountCheck {
        let word = "abcdefghijklmnopqrstuvwxyz"
        let digits = "0123456789"
        let correction = "&=_'-+,<>."

        if account.count < 16 && account.count > 30 { return .lackAccountTextLength }
        if account.count == 0 { return .empty }
        if !account.contains(where: word.contains) { return .lackWord }
        if !account.contains(where: digits.contains) { return .lackDigits }
        if !account.contains(where: correction.contains) { return .lackCorrection }
        else { return .valid }
    }

    
    func checkPassword(_ password: String) -> PasswordCheck {
        let tenCommonPasswords = ["123456", "123456789", "qwerty", "password", "12345678", "111111", "iloveyou", "1q2w3e", "123123", "password1"]
        let digits = "0123456789"
        let punctuation = "!@#$%^&*(),.<>;'`~[]{}\\|/?_-+= "
        let textLength = Int(passWordTextField.text?.count ?? 0)
        
        if tenCommonPasswords.contains(password) { return .containsCommonPassword }
        else if textLength == 0 { return .empty }
        else if !password.contains(where: { digits.contains($0) }) { return .lacksDigits }
        else if !password.contains(where: { punctuation.contains($0) }) { return.lacksPunctuation }
        else if textLength < 16 && textLength > 30 { return .lackTextLength }
        else  { return .valid }
    }


    @IBAction func loginButtonTapped(_ sender: Any) {
        let password = passWordTextField.text ?? ""
        let passwordCheckResult = checkPassword(password)
        let account = accountTextField.text ?? ""
        let accountCheckResult = checkAccountCorrection(account)
        
        if accountCheckResult != .valid {
            switch accountCheckResult {
            case .valid:
                print("帳號輸入成功")
            case.lackWord:
                print("帳號缺少英文字母")
                accountStatusLabel.text = "帳號缺少英文字母"
                accountLoginErrorUpdateUI()
            case .empty:
                print("帳號沒有輸入內容")
                accountStatusLabel.text = "帳號欄位不能空白"
                accountLoginErrorUpdateUI()
            case .lackCorrection:
                print("帳號型別不正確")
                accountStatusLabel.text = "帳號型別不正確，需輸入&=_'-+,<>."
                accountLoginErrorUpdateUI()
            case .lackAccountTextLength:
                print("帳號字數不正確")
                accountStatusLabel.text = "帳號字數不正確"
                accountLoginErrorUpdateUI()
            case .lackDigits:
                print("帳號缺少數字")
                accountStatusLabel.text = "帳號缺少數字"
                accountLoginErrorUpdateUI()
            }
        } else if accountCheckResult == .valid {
            print("帳號輸入成功")
            accountLoginSuccessUpdateUI ()
            customTextFieldStyle()
        }
        
        switch passwordCheckResult {
        case .valid:
            print("密碼符合輸入標準")
            passwordLoginSuccessUpdateUI()
            customTextFieldStyle()
        case .containsCommonPassword:
            print("密碼是共同密碼，建議更換")
            loginStautsLabel.text = "密碼是共同密碼，建議更換"
            passwordLoginErrorUpdateUI()
        case .lacksDigits:
            print("密碼少了數字")
            loginStautsLabel.text = "密碼少了數字"
            passwordLoginErrorUpdateUI()
        case .lacksPunctuation:
            print("密碼少了符號")
            loginStautsLabel.text = "密碼少了符號"
            passwordLoginErrorUpdateUI()
        case .lackTextLength:
            print("密碼長度需要在16至30字數之間")
            loginStautsLabel.text = "密碼長度需要在16至30個數字之間"
            passwordLoginErrorUpdateUI()
        case .empty:
            print("密碼欄位不能空白")
            loginStautsLabel.text = "密碼欄位不能空白"
            passwordLoginErrorUpdateUI()
            
        }
        
        if passwordCheckResult == .valid && accountCheckResult != .valid  {
            accountLoginErrorUpdateUI()
        }
        
        if accountCheckResult == .valid && passwordCheckResult == .valid
        { performSegue(withIdentifier: "GoToNextPage", sender: nil) }
    }

        
    @IBAction func showPasswordButtonTapped(_ sender: UIButton) {
        showPasswordButtonCount += 1
        let clickResult = showPasswordButtonCount
         if clickResult % 2 == 1 {
            showPasswordButton.isHidden = false
            passWordTextField.isSecureTextEntry = false
            print("show password")
        } else if clickResult % 2 == 0 {
            passWordTextField.isSecureTextEntry = true
            print("Hide password")
        }
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        showPasswordButton.isHidden = false
        print("textFieldDidBeginEditing")
    }
 
    @IBAction func dismissKeyboard(_ sender: Any) {
        view.endEditing(true)
        print("dismissKeyboard")
    }
    
    //add left side of line for OrLoginWith
    func addLine() {
        let lineView = UIView(frame: CGRect(x: 31, y: 590, width: 100, height: 1))
        lineView.layer.borderWidth = 1.0
        lineView.layer.borderColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1).cgColor
        self.view.addSubview(lineView)
        //add right side of line for OrLoginWith
        let secondLineView = UIView(frame: CGRect(x: 261, y: 590, width: 100, height: 1))
        secondLineView.layer.borderWidth = 1.0
        secondLineView.layer.borderColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1).cgColor
        self.view.addSubview(secondLineView)
    }
    
    //Set up placeholder
    func customPlaceholderUI() {
        //Enter your email
        let placeholderText = " Enter your email"
        accountTextField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 131/255, green: 145/255, blue: 161/255, alpha: 1)])
        //Enter your password
        let secondPlaceholderText = " Enter your password"
        passWordTextField.attributedPlaceholder = NSAttributedString(string: secondPlaceholderText, attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 131/255, green: 145/255, blue: 161/255, alpha: 1)])
    }
    
    //Set up titleLabel
    func customTitleLabel() {
        titleLabel.textColor = UIColor(red: 30/255, green: 35/255, blue: 44/255, alpha: 1)
        titleLabel.frame = CGRect(x: 31, y: 145, width: 330, height: 100)
        titleLabel.text = "Welcome back! \nGlad to see you, Again!"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
    }
        
    func accountLoginErrorUpdateUI () {
        let placeholderText = " Enter your email"
        accountTextField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemRed])
        accountTextField.layer.borderWidth = 1
        accountTextField.layer.borderColor = UIColor.systemRed.cgColor
        
        accountTextField.backgroundColor = UIColor(red: 255/255, green: 242/255, blue: 244/255, alpha: 1)
        accountStatusLabel.isHidden = false
        accountStatusLabel.textColor = .systemRed
        accountLoginStatusImageView.isHidden = false
        accountLoginStatusImageView.image = UIImage(systemName: "x.circle.fill")
        accountLoginStatusImageView.tintColor = .systemRed
    }

    func accountLoginSuccessUpdateUI () {
        accountStatusLabel.isHidden = false
        accountStatusLabel.text = "帳號是有效的"
        accountStatusLabel.textColor = .systemGreen
        loginStautsLabel.isHidden = true
        accountLoginStatusImageView.isHidden = false
        accountLoginStatusImageView.image =  UIImage(systemName: "checkmark.circle.fill")
        accountLoginStatusImageView.tintColor = .systemGreen
    }
    
    func passwordLoginErrorUpdateUI () {
        let secondPlaceholderText = " Enter your password"
        passWordTextField.attributedPlaceholder = NSAttributedString(string: secondPlaceholderText, attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemRed])
        passWordTextField.layer.borderWidth = 1
        passWordTextField.layer.borderColor = UIColor.systemRed.cgColor
        passWordTextField.backgroundColor = UIColor(red: 255/255, green: 242/255, blue: 244/255, alpha: 1)
        loginStautsLabel.textColor = .systemRed
        loginStautsLabel.isHidden = false
        passwordLoginStatusImageView.isHidden = false
        passwordLoginStatusImageView.image = UIImage(systemName: "x.circle.fill")
        passwordLoginStatusImageView.tintColor = .systemRed
        }
    
    func passwordLoginSuccessUpdateUI () {
        loginStautsLabel.text = "密碼是有效的"
        loginStautsLabel.textColor = .systemGreen
        loginStautsLabel.isHidden = false
        passwordLoginStatusImageView.isHidden = false
        passwordLoginStatusImageView.image = UIImage(systemName: "checkmark.circle.fill")
        passwordLoginStatusImageView.tintColor = .systemGreen
        }
        
        // 並在`customTextFieldStyle()`裡使用擴展方法
    func customTextFieldStyle() {
        accountTextField.setupTextFieldStyle()
        passWordTextField.setupTextFieldStyle()
        }
}

extension UITextField {
    func setupTextFieldStyle() {
        self.borderStyle = .roundedRect
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.gray.cgColor
        self.backgroundColor = UIColor(red: 247/255, green: 248/255, blue: 249/255, alpha: 1)
    }
}



