//
//  ProductService.swift
//  TemplateApp
//
//  Created by Mike Saradeth on 11/3/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation

class ProductService: NSObject {
    let urlString = "https://s3.us-east-2.amazonaws.com/juul-coding-challenge/products.json"
    struct PodsService: Codable {
        var products: [Product]
        
        enum CodingKeys: String, CodingKey {
            case products = "pods"
        }
    }
    
    func loadProduct(complectionHandler: @escaping ([Product])->()) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
            if statusCode == 200 {
                do {
                    let podService = try JSONDecoder().decode(PodsService.self, from: data!)
                    complectionHandler(podService.products)
                } catch let error {
                    print("error: \(error.localizedDescription)")
                }
            } else {
                print("Status Code: \(statusCode)")
            }
        }.resume()
    }
}
