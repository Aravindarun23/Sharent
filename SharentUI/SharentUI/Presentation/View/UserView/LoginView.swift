//
//  loginView1.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 17/02/23.
//

import Foundation
import AppKit

class loginView: NSView {

    var router: Router
    
    init(router: Router) {
        self.router =  router
        super.init(frame: NSRect())
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loginView() {
    login: while true {
            print("Enter Your Choice")
            print("1: User")
            print("2 : Admin")

        let userInput = Int(readLine()!)
            
            switch userInput {
            case 1 :
            exit:while true {
                    print("Enter Your Choice")
                    print("1: User Login")
                    print("2: User SignUp")
                    
                let uInput = Int(readLine()!)
                    switch uInput {
                    case 1:
                        router.movetoLoginPage()
                        break login
                    case 2:
                        router.moveSignUpPage()
                        break login
                    default :
                        print("error")
                    }
                }
            default:
                print("error")
            }
        }
    }
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            loginView()
        }
    }
}
