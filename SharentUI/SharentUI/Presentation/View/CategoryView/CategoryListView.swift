//
//  CatogeryListView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation
import SharentBackendMacOS
import AppKit

class CategoryListView: NSView, CategoreyListViewContrat {

    
    let categoryListPresenter: CategoryListPresenterContract
    
    init(categoryListPresenter: CategoryListPresenterContract) {
        self.categoryListPresenter = categoryListPresenter
        super.init(frame: NSRect())
    }
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            categoryListPresenter.viewDidload()
        }
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func load(categoryList: CategoryListResponse) {
        
        for category in categoryList.categoryList {
            print(category.id)
            print(category.name)
        }
    }
    
}
