//
//  APIHandler.swift
//  MVVMPractice
//
//  Created by Essa on 13/06/2024.
//

import Foundation

enum HTTPMethods : String {
    case get = "GET"
    case post = "POST"
    
}
protocol EndPointType {
    var path : String { get }
    var baseURL : String { get }
    var endPoint : String { get }
    var method : HTTPMethods { get }
}
enum EndPointItem {
    case product
}
extension EndPointItem : EndPointType {
   
    var baseURL: String {
        return "https://fakestoreapi.com/"
    }
    
    var endPoint: String {
        switch self {
        case .product : "products"
        }
    }
    
    var path: String {
        return ("\(baseURL)\(endPoint)")
    }
    
    var method: HTTPMethods {
        switch self {
        case .product: return .get
        }
    }
    
    
}
