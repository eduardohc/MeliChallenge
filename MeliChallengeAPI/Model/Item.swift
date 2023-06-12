//
//  Item.swift
//  MeliChallengeAPI
//
//  Created by Eduardo Hernandez on 11/06/23.
//

import Foundation
import ObjectMapper

struct Item: Mappable {
    var id: String = ""
    var condition: String = ""
    var title: String = ""
    var price: Int = 0
    var original_price: Int = 0
    var imageURL: String = ""
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map){
        id <- map["id"]
        condition <- map["condition"]
        title <- map["title"]
        price <- map["price"]
        original_price <- map["original_price"]
        imageURL <- map["thumbnail"]
    }
}
