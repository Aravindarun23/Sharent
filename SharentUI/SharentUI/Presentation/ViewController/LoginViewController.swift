//
//  LoginViewController.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 01/05/23.
//

import Foundation
import AppKit

class Authentication: NSViewController {
    
    
    let imageView = NSImageView()
    let loginForm : UserLoginView
    let signUpForm : AddNewUserView
    
    init(router: Router) {
        self.loginForm = Assembler.userLoginPageViewAssembler(router: router)
        self.signUpForm = Assembler.userSignUpPageViewAssembler(router: router)
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = NSView(frame: NSRect(x: 0, y: 0, width: (NSScreen.main?.frame.width)!, height: (NSScreen.main?.frame.height)!))
    }
    
    override func viewDidLoad() {
        view.addSubview(imageView)
        view.addSubview(loginForm)
        view.addSubview(signUpForm)
        configureImageView()
        addLoginForm()
        addSignUpForm()
        signUpForm.isHidden = true
    }
    
    func configureImageView() {
        imageView.image = NSImage(named: "loginImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 500),
            imageView.heightAnchor.constraint(equalToConstant: 600),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 65),
            NSLayoutConstraint(item: imageView, attribute: .right, relatedBy: .equal, toItem: view.self, attribute: .centerX, multiplier: 0.9, constant: 0),
        ])
    }
    
    func addLoginForm() {
        
        loginForm.wantsLayer = true
        loginForm.layer?.backgroundColor = .init(red: 0.2, green: 0.2, blue: 1, alpha: 0.2)
        loginForm.layer?.cornerRadius = 50
        view.addSubview(loginForm)
        loginForm.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginForm.heightAnchor.constraint(equalToConstant: 610),
            loginForm.widthAnchor.constraint(equalToConstant: 490),
            loginForm.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            NSLayoutConstraint(item: loginForm, attribute: .left, relatedBy: .equal, toItem: view.self, attribute: .centerX, multiplier: 1.2, constant: 0),
        ])
        
        let singleClickRecognizer = NSClickGestureRecognizer(target: self, action: #selector(moveToSignUp(sender:)))
        loginForm.signUpLabel.addGestureRecognizer(singleClickRecognizer)
        singleClickRecognizer.numberOfClicksRequired = 1
    }
    
    func addSignUpForm() {
        
        signUpForm.wantsLayer = true
        signUpForm.layer?.backgroundColor = .init(red: 0.2, green: 0.2, blue: 1, alpha: 0.2)
        signUpForm.layer?.cornerRadius = 50
        view.addSubview(signUpForm)
        signUpForm.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpForm.heightAnchor.constraint(equalToConstant: 800),
            signUpForm.widthAnchor.constraint(equalToConstant: 490),
            signUpForm.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            NSLayoutConstraint(item: signUpForm, attribute: .left, relatedBy: .equal, toItem: view.self, attribute: .centerX, multiplier: 1.2, constant: 0)
        ])
        
        let singleClickRecognizer = NSClickGestureRecognizer(target: self, action: #selector(moveToLogin(sender:)))
        signUpForm.loginLabel.addGestureRecognizer(singleClickRecognizer)
        singleClickRecognizer.numberOfClicksRequired = 1

    }
    
    @objc func moveToSignUp(sender: NSClickGestureRecognizer) {
        loginForm.isHidden = true
        signUpForm.isHidden = false
        view.window?.makeFirstResponder(signUpForm.nameTextField)
    }
    
    @objc func moveToLogin(sender: NSClickGestureRecognizer) {
        signUpForm.isHidden = true
        loginForm.isHidden = false
        view.window?.makeFirstResponder(loginForm.emailTextField)
    }
}
