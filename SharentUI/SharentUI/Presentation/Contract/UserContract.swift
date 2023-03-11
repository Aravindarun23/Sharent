//
//  UserContract.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 17/02/23.
//

import Foundation
import SharentBackendMacOS


protocol UserSignUpPageViewContract: AnyObject {
    
    func load(sucess: AddNewUserResponse)
    func failure(error: AddNewUserError)
}
protocol UserSignUpPagePresenterContract: AnyObject {
    
    func viewLoad(user: User)
}

protocol UserLoginViewContract: AnyObject {
    
    func load(name: String)
    func faiure(error: UserLoginError)
}
protocol UserLoginPresenterContract: AnyObject {
    
    func viewDidLoad(email: String, password: String)
}


protocol DeleteUserViewContract: AnyObject {
    
    func load(message: DeleteUserResponse)
    func faiure(error: DeleteUserError)
}

protocol DeleteUserPresenterContract: AnyObject {
    
    func viewDidLoad(userId: Int)
}

protocol EditUserDetailViewContract: AnyObject {

    func load(message: String)

}
protocol EditUserDetailPresenterContract: AnyObject {
    
    func viewDidLoad(userId: Int, addresss: String, pincode: String, mobileNumber: String)
}

protocol UpdatePasswordViewContract: AnyObject {
    
    func load(message: String)
}

protocol UpdatePasswordPresenterContract: AnyObject {
    func viewDidLoad(userId: Int, newPassword: String)
}

protocol VerifyPincodeViewContract: AnyObject {
    func load(pincodeList: [[String: Any]])
    func failure(error: Error)
}

protocol VerifyPincodePresenterContract: AnyObject {
    func viewDidLoad(pincode: String)
}
