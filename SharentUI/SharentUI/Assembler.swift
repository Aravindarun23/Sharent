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
        
        let deleteProductUseCase = deleteProductUseCase()
        let deleteProductPresenter =  DeleteProductPresenter(deleteProduct: deleteProductUseCase)
        deleteProductPresenter.router = router
        let deleteProductView = DeleteProductView(deleteProductPresenter: deleteProductPresenter)
        deleteProductPresenter.deleteProductView = deleteProductView
        return deleteProductView
        
    }
    
    private static func deleteProductUseCase() -> DeleteProduct {
        
        let deleteProductDataBaseService = DeleteProductDataBaseService()
        let deleteProductDataManager = DeleteProductDataManager(deleteProductDataBase: deleteProductDataBaseService)
        let deleteProductUseCase = DeleteProduct(deleteProductDataManager: deleteProductDataManager)
        
        return deleteProductUseCase
    }
}

extension Assembler {
    
    public static func deleteUserAssembler(router: Router) -> DeleteUserView {
        
        let deleteUserUseCase = deleteUserUserCase()
        let deleteUserPresenter =  DeleteUserPresenter(deleteUser: deleteUserUseCase)
        deleteUserPresenter.router = router
        let deleteUserView = DeleteUserView(deleteUserPresenter: deleteUserPresenter)
        deleteUserPresenter.deleteUserView = deleteUserView
        return deleteUserView
        
    }
    
    private static func deleteUserUserCase() -> DeleteUser {
        
        let deleteUserDataBaseService = DeleteUserDataBaseService()
        let deleteUserDataManager = DeleteUserDataManager(deleteUserDataBase: deleteUserDataBaseService)
        let deleteUserUseCase = DeleteUser(deleteUserDataManager: deleteUserDataManager)
        return deleteUserUseCase
    }
}


extension Assembler {
    
    public static func addCatogeryAssembler(router: Router) -> AddCatogeryView {
        
        let addCatogeryUseCase = addCatogeryUseCase()
        let addCatogeryPresenter = AddCatogeryPresenter(addCatogery: addCatogeryUseCase)
        addCatogeryPresenter.router = router
        let addCatogeryView = AddCatogeryView(addCatogeryPresenter: addCatogeryPresenter)
        addCatogeryPresenter.addCatogeryView = addCatogeryView
        return addCatogeryView
        
    }
    
    private static func addCatogeryUseCase() -> AddCatogery {
        
        let addCatogeryDataBaseService = AddCatogeryDataBaseService()
        let addCatogeryDataManager = AddCatogeryDataManager(addCatogeryDataBase: addCatogeryDataBaseService)
        let addCatogeryUseCase = AddCatogery(addCatogeryDataManager: addCatogeryDataManager)
        return addCatogeryUseCase
    }
    
    
}

extension Assembler  {
    
    public static func deleteCategoryAssembler(router: Router) -> DeleteCategoryView {
        let deleteCategoryUseCase = deleteCategoryUseCase()
        let deleteCategoryPresenter = DeleteCategoryPresenter(deleteCategory: deleteCategoryUseCase)
        deleteCategoryPresenter.router = router
        let deleteCategoryView = DeleteCategoryView(deleteCategoryPresenter: deleteCategoryPresenter)
        deleteCategoryPresenter.deleteCategoryView = deleteCategoryView
        return deleteCategoryView
    }
    
    private static func deleteCategoryUseCase() -> DeleteCategory {
        
        let deleteCategeryDataBaseService = DeleteCategoryDataBaseService()
        let deleteCategoryDataManager = DeleteCategoryDataManager(deleteCategoryDataBase: deleteCategeryDataBaseService)
        let deleteCategoryUseCase = DeleteCategory(deleteCategoryDataManager: deleteCategoryDataManager)
        return deleteCategoryUseCase
    }
}



extension Assembler {
    
    public static func adminLoginAssembler(router: Router) -> AdminLoginView {
        
        let adminLoginUseCase = adminLoginUseCase()
        let adminLoginPresenter = AdminLoginPresenter(adminLogin: adminLoginUseCase)
        adminLoginPresenter.roter = router
        let adminLoginView = AdminLoginView(adminLoginPresenter: adminLoginPresenter)
        adminLoginPresenter.adminLoginView = adminLoginView
        return adminLoginView
    }
    
    private static func adminLoginUseCase() -> AdminLogin {
        
        let adminLoginDataBaseService = AdminLoginDataBaseService()
        let adminLoginDataManager = AdminLoginDataManager(adminLoginDataBaseService: adminLoginDataBaseService)
        let adminLoginUseCase = AdminLogin(adminLoginDataManager: adminLoginDataManager)
        return adminLoginUseCase
    }
}


extension Assembler {
    
    public static func searchProductAssembler(router: Router) -> SearchProductView {
        
        let searchProductUseCase = searchProductUseCase()
        let searchProductPresenter = SearchProductPresenter(searchProduct: searchProductUseCase)
        searchProductPresenter.router = router
        let searchProductView = SearchProductView(searchProductPresenter: searchProductPresenter)
        searchProductPresenter.searchProductView = searchProductView
        return searchProductView
    }
    
    private static func searchProductUseCase() -> SearchProduct {
        
        let searchProductDataBaseService = SearchProductDataBaseService()
        let searchProductDataManager = SearchProductDataManager(searchProductDataBase: searchProductDataBaseService)
        let searchProductUseCase = SearchProduct(searchProductDataManger: searchProductDataManager)
        return searchProductUseCase
    }
}

extension Assembler {
    
    public static func placeOrderAssembler(router: Router) -> PlaceOrderView {
        
        let placeOrderUseCase = placeOrderUseCase()
        let placeOrderPresenter = PlaceOrderPresenter(placeOrder: placeOrderUseCase)
        placeOrderPresenter.router = router
        let placeOrderView = PlaceOrderView(placeOrderPresenter: placeOrderPresenter)
        placeOrderPresenter.placeOrderView = placeOrderView
        return placeOrderView
        
        
    }
    
    private static func placeOrderUseCase() -> PlaceOrder {
        let placeOrderDataBaseService = PlaceOrderDataBaseService()
        let placeOrderDataManager = PlaceOrderDataManager(placeOrderDataBase: placeOrderDataBaseService)
        let placeOrderUseCase = PlaceOrder(placeOrderDataManager: placeOrderDataManager)
        return placeOrderUseCase
    }
}


extension Assembler {
    
    public static func getOrderListAssembler(router: Router) -> GetOrderListView {
        let getOrderListUseCase = getOrderListUseCase()
        let getOrderListPresenter = GetOrderListPresenter(getOrderList: getOrderListUseCase)
        getOrderListPresenter.router = router
        let getOrderListView = GetOrderListView(getOrderListPresenter: getOrderListPresenter)
        getOrderListPresenter.getOrderListView = getOrderListView
        return getOrderListView
        
    }
    
    private static func getOrderListUseCase() -> GetOrderList {
        
        let getOrderListDataBaseService = GetOrderListDataBaseService()
        let getOrderListDataManager = GetOrderListDataManager(getOrderListDataBase: getOrderListDataBaseService)
        let getOrderListUseCase = GetOrderList(getOrderListDataManager: getOrderListDataManager)
        return getOrderListUseCase
    }
}

extension Assembler {
    
    public static func cancelOrderAssembler(router: Router) -> CancelOrderView{
        
        let cancelOrderUseCase = cancelOrderUseCase()
        let cancelOrderPresenter = CancelOrderPresenter(cancelOrder: cancelOrderUseCase)
        cancelOrderPresenter.router = router
        let cancelOrderView = CancelOrderView(cancelOrderPresenter: cancelOrderPresenter)
        cancelOrderPresenter.cancelOrderView = cancelOrderView
        return cancelOrderView
    }
    
    private static func cancelOrderUseCase() -> CancelOrder {
        
        let cancelOrderDataBaseService = CancelOrderDataBaseService()
        let cancelOrderDataManager = CancelOrderDataManager(cancelOrderDataBase: cancelOrderDataBaseService)
        let cancelOrderUseCase = CancelOrder(cancelOrderDataManager: cancelOrderDataManager)
        return cancelOrderUseCase
    }
}


extension Assembler {
    
    public static func getProductListView(router: Router) -> GetProductListView {
        
        let getProductListUseCase = getProductListUseCase()
        let getProductListPresenter =  GetProductListPresenter(getProductList: getProductListUseCase)
        getProductListPresenter.router = router
        let getProductListView = GetProductListView(getProductListPresenter: getProductListPresenter)
        getProductListPresenter.getProductListView = getProductListView
        return getProductListView
    }
    
    private static func getProductListUseCase() -> GetProductList {
        
        let getProductListDataBaseService = GetProductListDataBaseService()
        let getProductListDataManager = GetProductListDataManager(getProductListDataBase: getProductListDataBaseService)
        let getProductListUseCase = GetProductList(getProductListDataManager: getProductListDataManager)
        return getProductListUseCase
    }
}

extension Assembler {
    
    public static func editUserDetailView(router: Router) -> EditUserDetailView {
        
        let editUserDetailUseCase = editUserDetailUseCase()
        let editUserDetailPresenter = EditUserDetailPresenter(editUserDetail: editUserDetailUseCase)
        editUserDetailPresenter.router = router
        let editUserDetailView = EditUserDetailView(editUserDetailPresenter: editUserDetailPresenter)
        editUserDetailPresenter.editUserDetailView = editUserDetailView
        return editUserDetailView
        
        
    }
    
    private static func editUserDetailUseCase() -> EditUserDetail {
        
        let editUserDetailDataBaseService = EditUserDetailDataBaseService()
        let editUserDetailDataManager = EditUserDetailDataManager(editUserDetailDataBase: editUserDetailDataBaseService)
        let editUserDetailUseCase = EditUserDetail(editUserDetailDataManager: editUserDetailDataManager)
        return editUserDetailUseCase
    }
}


extension Assembler {
    
    public static func approveOrderView(router: Router) -> ApproveOrderView {
        let approveOrderUseCase = approveOrderUseCase()
        let approveOrderPresenter = ApproveOrderPresenter(approveOrder: approveOrderUseCase)
        approveOrderPresenter.router = router
        let approveOrdeView = ApproveOrderView(approveOrderPresenter: approveOrderPresenter)
        approveOrderPresenter.approveOrderView = approveOrdeView
        return approveOrdeView
    }
    
    private static func approveOrderUseCase() -> ApproveOrder {
        
        let approveOrderDataBaseService = ApproveOrderDataBaseService()
        let approveOrderDataManager = ApproveOrderDataManager(approveOrderDataBase: approveOrderDataBaseService)
        let approveOrderUseCase = ApproveOrder(approveOrderDataManager: approveOrderDataManager)
        return approveOrderUseCase
        
    }
}


extension Assembler {
    
    
    public static func getProductBookedDateView(router: Router) -> GetProductBookedDateView {
        
        let getProductBookedDate = getProductBookedDateUseCase()
        let getProductBookedDatePresenter = GetProductBookedDatePresenter(getProductBoookedDate: getProductBookedDate)
        getProductBookedDatePresenter.router = router
        let getProductBookedDateView = GetProductBookedDateView(getProductBookedDatePresenter: getProductBookedDatePresenter)
        getProductBookedDatePresenter.getProductBookedDateView = getProductBookedDateView
        return getProductBookedDateView
    }
    
    private static func getProductBookedDateUseCase() -> GetProductBookedDate {
        
        let getProductBookedDateDataBaseService = GetProductBookedDataBaseService()
        let getProductBookedDateDataManager = GetProductBookedDateDataManager(getProductBookedDateDataBase: getProductBookedDateDataBaseService)
        let getProductBookedDate = GetProductBookedDate(getProductBookedDateDataManager: getProductBookedDateDataManager)
        return getProductBookedDate
    }
}

extension Assembler {
    
    
    public static func updatePasswordView(router: Router) -> UpdatePasswordView {
        
        let updatePassword = updatePasswordUseCase()
        let updatePasswordPresenter = UpdatePasswordPresenter(updatePassword: updatePassword)
        updatePasswordPresenter.router = router
        let updatePasswordView = UpdatePasswordView(updatePasswordPresenter: updatePasswordPresenter)
        updatePasswordPresenter.updatePasswordView = updatePasswordView
        return updatePasswordView
    }
    
    
    private static func updatePasswordUseCase() -> UpdatePassword {
        
        let updatePasswordDataBaseService =  UpdatePasswordDataBaseService()
        let updatePasswordDataManager = UpdatePasswordDataManager(updatePasswordDataBase: updatePasswordDataBaseService)
        let updatePassword = UpdatePassword(updatePasswordDataManager: updatePasswordDataManager)
        return updatePassword
    }
}
