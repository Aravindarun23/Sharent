//
//  VerifyPincodeView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 11/03/23.
//

import Foundation
import AppKit


class VerifyPincodeView: NSView {
    
    let verifyPincodePresenter: VerifyPincodePresenterContract
    init(verifyPincodePresenter: VerifyPincodePresenterContract) {
        self.verifyPincodePresenter = verifyPincodePresenter
        super.init(frame: NSRect())
    }

    override func viewDidMoveToSuperview() {
        verifyPincodePresenter.viewDidLoad(pincode: "614602")
    }
    

    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VerifyPincodeView: VerifyPincodeViewContract {
    func load(pincodeList: [[String : Any]]) {
        for pincode in pincodeList {
            print(pincode)
        }
    }
    
    func failure(error: Error) {
        print(error)
    }
}
