//
//  UserLoginView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 27/02/23.
//

import Foundation
import AppKit
import SharentBackendMacOS

class UserLoginView: NSView {
    
    var presenter: UserLoginPresenterContract
    
    init(presenter: UserLoginPresenterContract) {
        self.presenter = presenter
        super.init(frame: NSRect())
        configureLoginForm()
    }
    var passwordTextField: NSSecureTextField!
    var emailTextField: NSTextField!
    var loginStack: NSStackView!
    var loginButton: NSButton!
    var signUpLabel: NSTextField!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureLoginForm() {
        
        let Loginlabel = getLabelString(text: "Login", size: 50)
        addSubview(Loginlabel)
        
        let emailLabe1 = getLabelString(text: "Email", size: 20)
        let emailTextField = congigureEmailTextField()
        let errorField1 = getLabelString(text: "Enter valid email", size: 15)
        errorField1.textColor = .red
        errorField1.isHidden = true
        let passwordLabel = getLabelString(text: "Password", size: 20)
        let passwordTextField = congigurePasswordTextField()
        let errorField2 = getLabelString(text: "Enter valid password", size: 15)
        errorField2.textColor = .red
        errorField2.isHidden = true
        loginStack = NSStackView(views: [emailLabe1, emailTextField, errorField1, passwordLabel, passwordTextField, errorField2])
        loginStack.orientation = .vertical
        loginStack.spacing = 20
        loginStack.alignment = .left
        addSubview(loginStack)
        
        loginButton = configureLoginButton()
        addSubview(loginButton)
        
        let string = "Don't have an account?  SignUp"
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.foregroundColor, value: NSColor.red, range: NSRange(location: 24, length: 6))
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 24, length: 6))
        signUpLabel = getLabelString(text: string , size: 15)
        signUpLabel.attributedStringValue = attributedString
        addSubview(signUpLabel)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        loginStack.translatesAutoresizingMaskIntoConstraints = false
        Loginlabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            Loginlabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -190),
            Loginlabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loginStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            loginStack.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 190),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
       
        NSLayoutConstraint.activate([
            signUpLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 255)
        ])
    }
    
    func congigureEmailTextField() -> NSBox {
        
        let borderBox = NSBox()
        emailTextField = NSTextField()
        borderBox.boxType = .custom
        emailTextField.placeholderString = "Enter Your Email"
        emailTextField.isEditable = true
        emailTextField.wantsLayer = true
        emailTextField.isSelectable = true
        emailTextField.isBordered = false
        emailTextField.focusRingType = .none
        emailTextField.usesSingleLineMode = true
        emailTextField.font = .systemFont(ofSize: 20)
        emailTextField.wantsLayer = true
        emailTextField.backgroundColor = .none
        borderBox.contentView = emailTextField
        borderBox.wantsLayer = true
        borderBox.layer?.cornerRadius = 10
        borderBox.borderWidth = 0
        borderBox.layer?.backgroundColor = .black
        emailTextField.translatesAutoresizingMaskIntoConstraints =  false
        borderBox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.centerYAnchor.constraint(equalTo: borderBox.centerYAnchor),
            borderBox.widthAnchor.constraint(equalToConstant: 400),
            borderBox.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        return borderBox
    }
    
    func congigurePasswordTextField() -> NSBox {
        
        let borderBox = NSBox()
        borderBox.boxType = .custom
        passwordTextField = NSSecureTextField()
        passwordTextField.placeholderString = "Enter Your Password"
        passwordTextField.isEditable = true
        passwordTextField.wantsLayer = true
        passwordTextField.isSelectable = true
        passwordTextField.isBordered = false
        passwordTextField.focusRingType = .none
        passwordTextField.usesSingleLineMode = true
        passwordTextField.font = .systemFont(ofSize: 20)
        passwordTextField.wantsLayer = true
        passwordTextField.backgroundColor = .none
        borderBox.contentView = passwordTextField
        borderBox.wantsLayer = true
        borderBox.layer?.cornerRadius = 10
        borderBox.borderWidth = 0
        borderBox.layer?.backgroundColor = .black
        passwordTextField.translatesAutoresizingMaskIntoConstraints =  false
        borderBox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.centerYAnchor.constraint(equalTo: borderBox.centerYAnchor),
            borderBox.widthAnchor.constraint(equalToConstant: 400),
            borderBox.heightAnchor.constraint(equalToConstant: 50)
        ])
        return borderBox
    }
    
    func getLabelString(text: String, size: Int) -> NSTextField {
        
        let textFiled = NSTextField(labelWithString: text)
        textFiled.font = .systemFont(ofSize: CGFloat(size))
        textFiled.isEditable = false
        textFiled.isSelectable = false
        return textFiled
    }
    
    func configureLoginButton() -> NSButton{
        let loginButton = NSButton()
        loginButton.title = "Login"
        loginButton.wantsLayer = true
        loginButton.isBordered = false
        loginButton.alignment = .center
        loginButton.controlSize = .large
        loginButton.target = self
        loginButton.action = #selector(authenticateUser(_:))
        loginButton.contentTintColor = .black
        loginButton.font = .systemFont(ofSize: 25)
        loginButton.layer?.backgroundColor = NSColor.systemOrange.cgColor
        loginButton.layer?.cornerRadius = 20
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        return loginButton
    }
    
    override func keyUp(with event: NSEvent) {
        if event.keyCode == 36 {
            if isValidEmail(emailTextField.stringValue) && passwordTextField.stringValue == "" {
                loginStack.views[2].isHidden = true
                loginStack.views[5].isHidden = false
                shake(view: passwordTextField)
                passwordTextField.becomeFirstResponder()
            }
            else if (passwordTextField.stringValue != "" && !isValidEmail(emailTextField.stringValue)) {
                shake(view: emailTextField)
                emailTextField.becomeFirstResponder()
                loginStack.views[5].isHidden = true
                loginStack.views[2].isHidden = false
                
            }
            else if (!isValidEmail(emailTextField.stringValue)) {
                loginStack.views[2].isHidden = false
                
                shake(view: emailTextField)
            }
            else if (passwordTextField.stringValue == "") {
                loginStack.views[5].isHidden = false
                shake(view: passwordTextField)
            }
            else if (passwordTextField.stringValue == "") && emailTextField.stringValue == ""  {
                emailTextField.becomeFirstResponder()
                shake(view: emailTextField)
                loginStack.views[2].isHidden = false
            }
            else {
                loginStack.views[5].isHidden = true
            }
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func shake(view: NSView) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(point: NSPoint(x: view.frame.origin.x - 10, y: view.frame.origin.y))
        animation.toValue = NSValue(point: NSPoint(x: view.frame.origin.x + 10, y: view.frame.origin.y))
        view.layer?.add(animation, forKey: "position")
    }
    
    @objc func authenticateUser(_ sender: NSButton) {
        presenter.viewDidLoad(email: emailTextField.stringValue, password: passwordTextField.stringValue)
    }
}


extension UserLoginView: UserLoginViewContract {
    func load(name: String) {
        print(name)
    }
    
    func faiure(error: SharentBackendMacOS.UserLoginError) {
        print("no")
    }
    
    
}
