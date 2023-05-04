//
//  UserContract.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 17/02/23.
//

import Foundation
import SharentBackendMacOS


protocol AddNewUserViewContract: AnyObject {
    
    func load(sucess: AddNewUserResponse)
    func failure(error: AddNewUserError)
}
protocol AddNewUserPresenterContract: AnyObject {
    
    func viewLoad(user: User)
}

protocol UserLoginViewContract: AnyObject {
    
    func load(user: User)
    func faiure(error: UserLoginError)
}
protocol UserLoginPresenterContract: AnyObject {
    
    func viewDidLoad(email: String, password: String)
}


protocol DeleteUserViewContract: AnyObject {
    
    func load(message: String)
    func faiure(error: Error)
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
