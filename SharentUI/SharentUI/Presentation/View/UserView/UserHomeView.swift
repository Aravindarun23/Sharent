//
//  UserHomeView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation
import AppKit


class UserHomeView: NSView {
    
    var router: Router
    
    init(router: Router) {
        self.router =  router
        super.init(frame: NSRect())
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            homeView()
        }
    }
    
    
    func homeView() {
        
    exit: while true {
        
            print("Enter Your Choice")
            print("1: Add Products")
            print("2: View Product")
            print("3: SearchByPincode")
            print("4: SearchProduct")
            let choice = Int(readLine()!)
            switch choice  {
            case 1:
                router.getCatogeryView()
                break exit
                
            default :
                print("error")
            }
        }
    }
}
