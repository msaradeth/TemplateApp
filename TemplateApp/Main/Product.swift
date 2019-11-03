//
//  Product.swift
//  TemplateApp
//
//  Created by Mike Saradeth on 11/3/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//
import Foundation

struct Product: Codable, Equatable {
    var id: String
    var name: String
    var description: String
    var price: Decimal
    var thumbnailUrlString: String
    var imageUrlString: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case price
        case thumbnailUrlString = "thumbnail_url"
        case imageUrlString = "image_url"
    }
}
