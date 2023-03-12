//
//  CatogeryListPresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 28/02/23.
//

import Foundation
import SharentBackendMacOS

class CategoryListPresenter: CategoryListPresenterContract {
    
    let getCategoryList: GetCategoryList
    weak var categoryListView: CategoreyListViewContrat?
    weak var router: Router?
    
    init(getCategoryList: GetCategoryList) {
        self.getCategoryList = getCategoryList
    }
    
    func viewDidload() {
        
        getCategoryList.execute(request: CategoryListRequest()) {
            response in
            self.categoryListView?.load(categoryList: response)
        } onFailure: { error in
            
        }
    }
}
