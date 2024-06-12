//
//  Products.swift
//  MVVMPractice
//
//  Created by Essa on 13/06/2024.
//

import Foundation
struct Products : Decodable {
    
    let id : Int
    let title : String
    let price: Float
    let description : String
    let category : String
    let image : String
    let rating : Rate
    
}

struct Rate : Decodable {
    let rate : Float
    let count : Int
}
