//
//  AddCatogeryView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation
import AppKit
import SharentBackendMacOS


class AddCategoryView: NSView {
    
    let addCategoryPresenter: AddCategoryPresenterContract
    
    init(addCategoryPresenter: AddCategoryPresenterContract) {
        self.addCategoryPresenter = addCategoryPresenter
        super.init(frame: NSRect())
    }
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            addCategoryPresenter.viewDidload(categoryName: "Desktop")
        }
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddCategoryView: AddCategoryViewContract {
    
    func load(response: String) {
        print(response)
    }
}

