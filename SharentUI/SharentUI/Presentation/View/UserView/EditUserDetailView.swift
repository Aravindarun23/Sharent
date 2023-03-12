//
//  EditUserDetailView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 09/03/23.
//

import Foundation
import AppKit

class EditUserDetailView: NSView {
    
    let editUserDetailPresenter: EditUserDetailPresenterContract
    init(editUserDetailPresenter: EditUserDetailPresenterContract) {
        self.editUserDetailPresenter = editUserDetailPresenter
        super.init(frame: NSRect())
    }
    
    override func viewDidMoveToSuperview() {
        editUserDetailPresenter.viewDidLoad(userId: 1, addresss: "140/d, NorthStreet", pincode: "614602", mobileNumber: "909090900")
    }
    
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EditUserDetailView : EditUserDetailViewContract {
    
    func load(message: String) {
        print(message)
    }
}
