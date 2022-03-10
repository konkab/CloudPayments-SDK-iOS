//
//  PostThreeDsRequest.swift
//  Cloudpayments
//
//  Created by Sergey Iskhakov on 01.07.2021.
//

import Foundation

class PostThreeDsRequest: BaseRequest, CloudpaymentsRequestType {
    typealias ResponseType = TransactionResponse
    var data: CloudpaymentsRequest {
        return CloudpaymentsRequest(path: CloudpaymentsHTTPResource.post3ds.asUrl(), method: .post, params: params, headers: headers)
    }
}
