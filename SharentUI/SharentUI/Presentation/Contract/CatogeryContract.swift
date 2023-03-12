//
//  CatogeryContract.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 02/03/23.
//

import Foundation
import SharentBackendMacOS

protocol CategoryListPresenterContract: AnyObject{
    func viewDidload()
}
protocol CategoreyListViewContrat: AnyObject {
    func load(categoryList: CategoryListResponse)
}

protocol AddCategoryViewContract: AnyObject {
    func load(response: String)
}

protocol AddCategoryPresenterContract: AnyObject {
    func viewDidload(categoryName: String)
}


protocol DeleteCategoryViewContract: AnyObject {
    func load(response: String)
}

protocol DeleteCategoryPresenterContract: AnyObject {
    func viewDidload(categoryId: Int)
}
