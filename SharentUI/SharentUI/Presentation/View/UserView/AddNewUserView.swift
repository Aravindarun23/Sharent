//
//  UserSignUpPageView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 16/02/23.
//

import Foundation
import AppKit
import SharentBackendMacOS

class AddNewUserView: NSView {
    
    var presenter: AddNewUserPresenterContract
    var user: User?
    var passwordTextField = NSSecureTextField()
    var emailTextField = NSTextField()
    var mobileTextField = NSTextField()
    var nameTextField = NSTextField()
    var pincodeTextField = NSTextField()
    var signUpStack: NSStackView!
    var signUpButton: NSButton!
    var loginLabel: NSTextField!
        
    init(presenter: AddNewUserPresenterContract) {
        self.presenter = presenter
        super.init(frame: NSRect())
        updateSignUpForm()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      
    }
    
    func updateSignUpForm() {

        let signUpLabel = getLabelString(text: "Sign Up", size: 50)
        addSubview(signUpLabel)
        
        let nameLabe1 = getLabelString(text: "Name", size: 20)
        let nameTextFieldBox = getTextField(placeHolderString: "Enter Your Name", textField: &nameTextField)
        let nameError = getLabelString(text: "", size: 15)
        nameError.textColor = .red
        let emailLabel = getLabelString(text: "Email", size: 20)
        let emailTextFieldBox = getTextField(placeHolderString: "Enter Your Email", textField: &emailTextField)
        let emailError = getLabelString(text: "", size: 15)
        emailError.textColor = .red
        let passwordLabel = getLabelString(text: "Password", size: 20)
        let passwordTextFieldBox = getSecureTextField(placeHolderString: "Enter Password", textField: &passwordTextField)
        let passwordError = getLabelString(text: "", size: 15)
        passwordError.textColor = .red
        let mobileLabel = getLabelString(text: "MobileNumber", size: 20)
        let mobileTextFieldBox = getTextField(placeHolderString: "Enter Your MobileNumber", textField: &mobileTextField)
        let mobileError = getLabelString(text: "", size: 15)
        mobileError.textColor = .red
        let pincodeLabel = getLabelString(text: "Pincode", size: 20)
        let pincodeTextFieldBox = getTextField(placeHolderString: "Enter Pincode", textField: &pincodeTextField)
        let pincodeError = getLabelString(text: "", size: 15)
        pincodeError.textColor = .red
        
        signUpStack = NSStackView(views: [nameLabe1, nameTextFieldBox, nameError,emailLabel, emailTextFieldBox, emailError,  passwordLabel, passwordTextFieldBox, passwordError, mobileLabel, mobileTextFieldBox, mobileError, pincodeLabel,pincodeTextFieldBox,pincodeError])
        signUpStack.wantsLayer = true
        signUpStack.layer?.backgroundColor = .none
        signUpStack.orientation = .vertical
        signUpStack.spacing = 8
        signUpStack.alignment = .left
        addSubview(signUpStack)
               
        signUpButton = configureSignUpButton()
        addSubview(signUpButton)
        
        
        let string = "Already have an account!  Login"
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.foregroundColor, value: NSColor.red, range: NSRange(location: 26, length: 5))
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 26, length: 5))
        loginLabel = getLabelString(text: string , size: 15)
        loginLabel.attributedStringValue = attributedString
        
        addSubview(loginLabel)
        
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signUpLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            signUpStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            signUpStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpLabel.bottomAnchor.constraint(equalTo: signUpStack.topAnchor,constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signUpStack.bottomAnchor, constant: 20),
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 10)
        ])
    }
    
    func getTextField(placeHolderString: String, textField: inout NSTextField) -> NSBox {
        
        let textFieldContainerBox = NSBox()
        textFieldContainerBox.boxType = .custom
        textField.placeholderString = placeHolderString
        textField.isEditable = true
        textField.wantsLayer = true
        textField.isSelectable = true
        textField.isBordered = false
        textField.focusRingType = .none
        textField.usesSingleLineMode = true
        textField.font = .systemFont(ofSize: 20)
        textField.wantsLayer = true
        textField.backgroundColor = .none
        textFieldContainerBox.contentView = textField
        textFieldContainerBox.wantsLayer = true
        textFieldContainerBox.layer?.cornerRadius = 10
        textFieldContainerBox.borderWidth = 0
        textFieldContainerBox.layer?.backgroundColor = .black
        textField.translatesAutoresizingMaskIntoConstraints =  false
        textFieldContainerBox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.centerYAnchor.constraint(equalTo: textFieldContainerBox.centerYAnchor),
            textFieldContainerBox.widthAnchor.constraint(equalToConstant: 400),
            textFieldContainerBox.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        return textFieldContainerBox
    }
    
    
    func getSecureTextField(placeHolderString: String, textField: inout NSSecureTextField) -> NSBox {
        
        let textFieldContainerBox = NSBox()
        textFieldContainerBox.boxType = .custom
        textField.placeholderString = placeHolderString
        textField.isEditable = true
        textField.wantsLayer = true
        textField.isSelectable = true
        textField.isBordered = false
        textField.focusRingType = .none
        textField.usesSingleLineMode = true
        textField.font = .systemFont(ofSize: 20)
        textField.wantsLayer = true
        textField.backgroundColor = .none
        textFieldContainerBox.contentView = textField
        textFieldContainerBox.wantsLayer = true
        textFieldContainerBox.layer?.cornerRadius = 10
        textFieldContainerBox.borderWidth = 0
        textFieldContainerBox.layer?.backgroundColor = .black
        textField.translatesAutoresizingMaskIntoConstraints =  false
        textFieldContainerBox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textFieldContainerBox.widthAnchor.constraint(equalToConstant: 400),
            textFieldContainerBox.heightAnchor.constraint(equalToConstant: 50),
            textField.centerYAnchor.constraint(equalTo: textFieldContainerBox.centerYAnchor),
        ])
        return textFieldContainerBox
    }
    
    func getLabelString(text: String, size: Int) -> NSTextField {
        
        let textFiled = NSTextField(labelWithString: text)
        textFiled.font = .systemFont(ofSize: CGFloat(size))
        textFiled.isEditable = false
        textFiled.isSelectable = false
        return textFiled
    }
    
    func configureSignUpButton() -> NSButton{
        let signUpButton = NSButton()
        signUpButton.title = "Sign Up"
        signUpButton.wantsLayer = true
        signUpButton.isBordered = false
        signUpButton.alignment = .center
        signUpButton.controlSize = .large
        signUpButton.contentTintColor = .black
        signUpButton.font = .systemFont(ofSize: 20)
        signUpButton.layer?.backgroundColor = NSColor.systemOrange.cgColor
        signUpButton.layer?.cornerRadius = 20
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            signUpButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        return signUpButton
    }
    
    override func keyUp(with event: NSEvent) {
        
    }
   
}

extension AddNewUserView: AddNewUserViewContract {
    func load(sucess: SharentBackendMacOS.AddNewUserResponse) {
        print("yes")
    }
    
    func failure(error: SharentBackendMacOS.AddNewUserError) {
        print("no")
    }
    
    
}
