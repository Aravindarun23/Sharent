//
//  AddCatogeryView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation
import AppKit
import SharentBackendMacOS


class AddCatogeryView: NSView {
    
    let a: String
    let addCatogeryPresenter: AddCatogeryPresenterContract
    
    init(addCatogeryPresenter: AddCatogeryPresenterContract) {
        self.addCatogeryPresenter = addCatogeryPresenter
        super.init(frame: NSRect())
    }
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            addCatogeryPresenter.viewDidload(catogeryName: "Electronics")
        }
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension AddCatogeryView: AddCatogeryViewContract {
    
    func load(response: AddCatogeryResponse) {
        print(response.responseMsg)
    }
}
