//
//  Bundle+Extenstions.swift
//  sdk
//
//  Created by Sergey Iskhakov on 16.09.2020.
//  Copyright © 2020 Cloudpayments. All rights reserved.
//

import Foundation

extension Bundle {
    class var mainSdk: Bundle {
        var ourBundle: Bundle?
        #if SWIFT_PACKAGE
            ourBundle = Bundle.module
        #endif

        if ourBundle == nil {
            ourBundle = Bundle(path: "CloudPayments.bundle")
        }

        if ourBundle == nil {
            // This might be the same as the previous check if not using a dynamic framework
            if let path = Bundle(for: PaymentForm.self).path(
                forResource: "CloudPayments", ofType: "bundle")
            {
                ourBundle = Bundle(path: path)
            }
        }

        if ourBundle == nil {
            // This will be the same as mainBundle if not using a dynamic framework
            ourBundle = Bundle(for: PaymentForm.self)
        }

        if let ourBundle = ourBundle {
            return ourBundle
        } else {
            return Bundle.main
        }
    }
}
