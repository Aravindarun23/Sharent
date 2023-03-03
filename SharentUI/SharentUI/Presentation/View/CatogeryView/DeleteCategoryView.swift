//
//  DeleteCategoryView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 03/03/23.
//

import Foundation
import AppKit
import SharentBackendMacOS



class DeleteCategoryView: NSView {
    
    let deleteCategoryPresenter: DeleteCategoryPresenterContract
    
    init(deleteCategoryPresenter: DeleteCategoryPresenterContract) {
        self.deleteCategoryPresenter = deleteCategoryPresenter
        super.init(frame: NSRect())
    }
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            deleteCategoryPresenter.viewDidload(categoryId: 2)
        }
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DeleteCategoryView: DeleteCategoryViewContract {
    func load(response: DeleteCategoryResponse) {
        print(response.responseMsg)
    }
    
        
}
