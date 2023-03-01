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

protocol UserLoginViewContract : AnyObject {
    func load(name: String)
    func faiure(error: UserLoginError)
}
protocol UserLoginPresenterContract: AnyObject {
    func viewDidLoad(email: String, password: String)
}

