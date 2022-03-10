//
//  ChargeRequest.swift
//  Cloudpayments
//
//  Created by Sergey Iskhakov on 01.07.2021.
//

import Foundation

class ChargeRequest: BaseRequest, CloudpaymentsRequestType {
    typealias ResponseType = TransactionResponse
    var data: CloudpaymentsRequest {
        return CloudpaymentsRequest(path: CloudpaymentsHTTPResource.charge.asUrl(), method: .post, params: params, headers: headers)
    }
}
