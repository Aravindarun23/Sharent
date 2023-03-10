//
//  GetProductBookedDatePresenter.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 10/03/23.
//

import Foundation
import SharentBackendMacOS

class GetProductBookedDatePresenter {
    
    let getProductBoookedDate: GetProductBookedDate
    weak var getProductBookedDateView: GetProductBookedDateViewContract?
    weak var router: Router?
    
    init(getProductBoookedDate: GetProductBookedDate, getProductBookedDateView: GetProductBookedDateViewContract? = nil, router: Router? = nil) {
        self.getProductBoookedDate = getProductBoookedDate
        self.getProductBookedDateView = getProductBookedDateView
        self.router = router
    }
}

extension GetProductBookedDatePresenter: GetProductBookedDatePresenterContract {
    
    func viewDidLoad(productId: Int) {
        let request = GetProductBookedDateRequest(productId: productId)
        getProductBoookedDate.execute(request: request) {
            response in
            self.getProductBookedDateView?.load(dateList: response.dateList)
        } onFailure: { error in
            
        }
    }
}
