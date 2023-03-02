//
//  DeleteUserView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation
import AppKit
import SharentBackendMacOS

class DeleteUserView: NSView {
    
    let deleteUserPresenter: DeleteUserPresenterContract
    
    init(deleteUserPresenter: DeleteUserPresenterContract) {
        self.deleteUserPresenter = deleteUserPresenter
        super.init(frame: NSRect())
    }
    
    override func viewDidMoveToSuperview() {
        deleteUserPresenter.viewDidLoad(userId: 4)
    }
    
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DeleteUserView: DeleteUserViewContract {
    
    func load(message: DeleteUserResponse) {
        print(message.responseMsg)
    }
    
    func faiure(error: DeleteUserError) {
    }
}
