//
//  DataEncoding.swift
//  MDesignIcon
//
//  Created by desingn on 2022/1/10.
//  Copyright © 2021 MDesign. All rights reserved.
//

import UIKit
import SwiftyStoreKit
import StoreKit

class ExchangeManage: NSObject {
    class func exchangeWithSSK(objcetID: String, completion: @escaping (PurchaseResult) -> Void) {        
        SwiftyStoreKit.purchaseProduct(objcetID) { a in
            completion(a)
        }
    }
}
