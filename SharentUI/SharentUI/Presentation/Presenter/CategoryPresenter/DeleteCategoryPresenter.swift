//
//  DeleteCategoryPresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 03/03/23.
//

import Foundation
import SharentBackendMacOS

class DeleteCategoryPresenter {
    
    let deleteCategory: DeleteCategory
    weak var deleteCategoryView: DeleteCategoryViewContract?
    weak var router: Router?
    
    init(deleteCategory: DeleteCategory) {
        self.deleteCategory = deleteCategory
    }
}

extension DeleteCategoryPresenter: DeleteCategoryPresenterContract {
    
    func viewDidload(categoryId: Int) {
        let request = DeleteCategoryRequest(categoryId: categoryId)
        deleteCategory.execute(request: request) {
            response in
            self.deleteCategoryView?.load(response: response.responseMsg)
        } onFailure: { error in
            
        }
    }
    
    
}
