//
//  CatogeryListView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation
import SharentBackendMacOS
import AppKit

class CatogeryListView: NSView, CatogreyListViewContrat {

    
    let catogeryListPresenter: CatogeryListPresenterContract
    
    init(catogeryListPresenter: CatogeryListPresenterContract) {
        self.catogeryListPresenter = catogeryListPresenter
        super.init(frame: NSRect())
    }
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            catogeryListPresenter.viewDidload()
        }
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func load(catogeryList: CatogeryListResponse) {
        
        for i in catogeryList.catogeryList {
            print(i.id)
            print(i.name)
        }
    }
    
}
