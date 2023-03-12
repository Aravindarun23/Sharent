//
//  AddCatogeryPresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation
import SharentBackendMacOS


class AddCategoryPresenter: AddCategoryPresenterContract {
    
    let addCategory: AddCategory
    weak var addCategoryView: AddCategoryViewContract?
    weak var router: Router?
    
    init(addCategory: AddCategory) {
        self.addCategory = addCategory
    }
    
    func viewDidload(categoryName: String) {
        let request = AddCategoryRequest(categoryName: categoryName)
        addCategory.execute(request: request) {
            response in
            self.addCategoryView?.load(response: response.responseMsg)
        } onFailure: { error in
            
        }
    }
}
