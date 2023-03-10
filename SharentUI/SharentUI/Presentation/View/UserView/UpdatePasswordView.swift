//
//  UpdatePasswordView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 10/03/23.
//

import Foundation
import AppKit

class UpdatePasswordView: NSView {
    
    let updatePasswordPresenter: UpdatePasswordPresenterContract
    init(updatePasswordPresenter: UpdatePasswordPresenterContract) {
        self.updatePasswordPresenter = updatePasswordPresenter
        super.init(frame: NSRect())
    }
    
    
    override func viewDidMoveToSuperview() {
        updatePasswordPresenter.viewDidLoad(userId: 1, newPassword: "arun@123")
    }
    

    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UpdatePasswordView: UpdatePasswordViewContract {
    
    func load(message: String) {
        print(message)
    }
}
