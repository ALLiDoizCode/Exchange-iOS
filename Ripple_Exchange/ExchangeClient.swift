//
//  ExchangeClient.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/22/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case createUser(parameters: Parameters)
    case newAccount(parameters: Parameters)
    case createCustomer(parameters: Parameters)
    case signIn(parameters: Parameters)
    case addInbound(parameters: Parameters)
    case createOutBound(parameters: Parameters)
    case charge(parameters: Parameters)
    case withdrawInbound(parameters: Parameters)
    case withdrawOutbound(parameters: Parameters)
    case deposit(parameters: Parameters)
    case transaction(parameters: Parameters)
    case exchangeTransaction(parameters: Parameters)
    case accountInfo(parameters: Parameters)
    case rippleInfo(parameters: Parameters)
    
    static let baseURLString = "https://ripple-exchange-app.herokuapp.com/"
    static let token = ""
    
    var method: HTTPMethod {
        switch self {
            case .createUser:
                return .post
            case .newAccount:
                return .post
            case .createCustomer:
                return .post
            case .signIn:
                return .post
            case .addInbound:
                return .post
            case .createOutBound:
                return .post
            case .withdrawInbound:
                return .post
            case .withdrawOutbound:
                return .post
            case .deposit:
                return .get
            case .transaction:
                return .get
            case .exchangeTransaction:
                return .post
            case .accountInfo:
                return .get
            case .rippleInfo:
                return .get
        default:
            return .get
        }
    }
    
    var path: String {
        switch self {
            case .createUser:
                return "/users"
            case .newAccount:
                return "/users/"
            case .createCustomer:
                return "/users/"
            case .signIn:
                return "/users/"
            case .addInbound:
                return "/users/"
            case .createOutBound:
                return "/users/"
            case .withdrawInbound:
                return "/users/"
            case .withdrawOutbound:
                return "/users/"
            case .deposit:
                return "/users/"
            case .transaction:
                return "/users/"
            case .exchangeTransaction:
                return "/users/"
            case .accountInfo:
                return "/users/"
            case .rippleInfo:
                return "/users/"
        default:
            return ""
        }
    }
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
            case .createUser(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .newAccount(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .createCustomer(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .signIn(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        
            default:
                break
        }
        urlRequest.setValue(Router.token, forHTTPHeaderField: "Authorization")
        return urlRequest
    }
}
