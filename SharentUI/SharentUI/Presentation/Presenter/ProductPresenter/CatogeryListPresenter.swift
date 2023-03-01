//
//  CatogeryListPresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation
import SharentBackendMacOS

class CatogeryListPresenter: CatogeryListPresenterContract {
    
    let getCatogeryList: GetCatogeryList
    weak var catogeryListView: CatogreyListViewContrat?
    weak var router: Router?
    
    init(getCatogeryList: GetCatogeryList) {
        self.getCatogeryList = getCatogeryList
    }
    
    func viewDidload() {
        
        getCatogeryList.execute(request: CatogeryListRequest()) {
            response in
            self.catogeryListView?.load(catogeryList: response)
        } onFailure: { error in
            
        }
    }
}
