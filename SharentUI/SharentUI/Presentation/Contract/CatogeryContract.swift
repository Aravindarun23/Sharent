//
//  CatogeryContract.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation
import SharentBackendMacOS

protocol CatogeryListPresenterContract: AnyObject{
    func viewDidload()
}
protocol CatogreyListViewContrat: AnyObject {
    func load(catogeryList: CatogeryListResponse)
}

protocol AddCatogeryViewContract: AnyObject {
    func load(response: AddCatogeryResponse)
}

protocol AddCatogeryPresenterContract: AnyObject {
    func viewDidload(catogeryName: String)
}


protocol DeleteCategoryViewContract: AnyObject {
    func load(response: DeleteCategoryResponse)
}

protocol DeleteCategoryPresenterContract: AnyObject {
    func viewDidload(categoryId: Int)
}
