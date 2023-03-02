//
//  Assembler.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 16/02/23.
//

import Foundation
import SharentBackendMacOS

class Assembler {
    
    public static func userSignUpPageViewAssembler(router: Router) -> UserSignUpPageView {
        let userSignUpUseCase = userSignUpUseCase()
        let userSignUpPagePresenter = UserSignUpPagePresenter(addNewUser: userSignUpUseCase)
        userSignUpPagePresenter.router = router
        let userSignUpPageView = UserSignUpPageView(presenter: userSignUpPagePresenter)
        userSignUpPagePresenter.userSignUpPageview = userSignUpPageView
        return userSignUpPageView
        
    }
    
    
    private static func userSignUpUseCase() -> AddNewUser {
        
        let userSignUpDatabase  = AddNewUserDataBaseService()
        let userSignUpDataManager = AddNewUserDataManager(addNewUserDataBase: userSignUpDatabase)
        let userSignUpUseCase = AddNewUser(addNewUserDataManager: userSignUpDataManager)
        return userSignUpUseCase
    
    }
}

extension Assembler {
    static func signupAssembler(router: Router) -> loginView {
        return loginView(router: router)
        
    }
}


extension Assembler {
    
    public static func userLoginPageViewAssembler(router: Router) -> UserLoginView {
        let userLoginUseCase = userLoginUseCase()
        let userLoginPagePresenter = UserLoginPagePresenter(userLogin: userLoginUseCase)
        userLoginPagePresenter.router = router
        let userLoginPageView = UserLoginView(presenter: userLoginPagePresenter)
        userLoginPagePresenter.userLoginPageView = userLoginPageView
        return userLoginPageView
        
    }
    
    
    private static func userLoginUseCase() -> UserLogin {
        
        let userLoginDataBase = UserLoginDataBaseService()
        let userLoginDataManager = UserLoginDataManager(userLoginDataBase: userLoginDataBase)
        let userLoginUseCase = UserLogin(userLoginDataManager: userLoginDataManager)
        return userLoginUseCase
    }
}

extension Assembler {
    
    
    
    public static func catogeryListviewAssembler(router: Router) -> CatogeryListView {
        
        let catogeryListUseCase = catogeryListUseCase()
        let catogeryListPresenter = CatogeryListPresenter(getCatogeryList: catogeryListUseCase)
        catogeryListPresenter.router = router
        let catogeryListView = CatogeryListView(catogeryListPresenter: catogeryListPresenter)
        catogeryListPresenter.catogeryListView = catogeryListView
        return catogeryListView
    }
    
    private static func catogeryListUseCase() -> GetCatogeryList {
        
        let catogeryListDataBase = CatogeryListDataBaseService()
        let catogeryListDataManager = CatogeryListDataManager(catogerylistDataBaseService: catogeryListDataBase)
        let catogeryListUseCase =  GetCatogeryList(catogeryListDataManager: catogeryListDataManager)
        return catogeryListUseCase
        
    }
    
}


extension Assembler {
    
    public static func userHomeViewAssembler(router: Router) -> UserHomeView {
        return UserHomeView(router: router)
    }
    
}


extension Assembler {
    
    public static func addNewProductAssembler(router: Router) -> AddNewProductView {
        
        let addNewProductUseCase = addNewProductUseCase()
        let addNewProductPresenter = AddNewProductPresenter(addNewProduct: addNewProductUseCase)
        addNewProductPresenter.router = router
        let addNewProductView = AddNewProductView(addNewProductPresenter: addNewProductPresenter)
        addNewProductPresenter.addNewProductView = addNewProductView
        return addNewProductView
        
    }
    
    private static func addNewProductUseCase() -> AddNewProduct {
        
        let addNewProductDataBaseService = AddNewProductDataBaseService()
        let addNewProductDataManager = AddNewProductDataManager(addNewProductDataBase: addNewProductDataBaseService)
        let addNewProductUseCase = AddNewProduct(addNewProductDataManager: addNewProductDataManager)
        return addNewProductUseCase
    }
}


extension Assembler  {
    
    public static func editProductDetailAssembler(router: Router) -> EditProductDetailView {
        
        let editProductDetailUseCase = editProductDetailUseCase()
        let editProductDetailPresenter = EditProductDetailPresenter(editProductDetail: editProductDetailUseCase)
        editProductDetailPresenter.router = router
        let editProductDetailView = EditProductDetailView(EditProductDetailPresenter: editProductDetailPresenter)
        editProductDetailPresenter.EditProductDetailView = editProductDetailView
        return editProductDetailView
        
    }
    
    private static func editProductDetailUseCase() -> EditProductDetail {
        
        let editProductDetailDataBaseService = EditProductDetailDataBaserService()
        let editProductDetailDataManager = EditProductDetailDataManager(editProductDetailDataBase: editProductDetailDataBaseService)
        let editProductDetailUseCase = EditProductDetail(editProductDetailDataManager: editProductDetailDataManager)
        return editProductDetailUseCase
    }
}

extension Assembler {
    
    public static func deleteProductAssembler(router: Router) -> DeleteProductView {
        
        let deleteProductUseCase = deleteProductAssembler()
        let deleteProductPresenter =  DeleteProductPresenter(deleteProduct: deleteProductUseCase)
        deleteProductPresenter.router = router
        let deleteProductView = DeleteProductView(deleteProductPresenter: deleteProductPresenter)
        deleteProductPresenter.deleteProductView = deleteProductView
        return deleteProductView
        
    }
    
    private static func deleteProductAssembler() -> DeleteProduct {
        
        let deleteProductDataBaseService = DeleteProductDataBaseService()
        let deleteProductDataManager = DeleteProductDataBaseManager(deleteProductDataBase: deleteProductDataBaseService)
        let deleteProductUseCase = DeleteProduct(deleteProductDataManager: deleteProductDataManager)
        
        return deleteProductUseCase
    }
}
