//
//  AddCatogeryPresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation
import SharentBackendMacOS


class AddCatogeryPresenter: AddCatogeryPresenterContract {
    
    let addCatogery: AddCatogery
    weak var addCatogeryView: AddCatogeryViewContract?
    weak var router: Router?
    
    init(addCatogery: AddCatogery) {
        self.addCatogery = addCatogery
    }
    
    func viewDidload(catogeryName: String) {
        let request = AddCatogeryRequest(catogeryName: catogeryName)
        addCatogery.execute(request: request) {
            response in
            self.addCatogeryView?.load(response: response)
        } onFailure: { error in
            
        }
    }
}
