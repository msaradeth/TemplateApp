//
//  ProductViewModel.swift
//  TemplateApp
//
//  Created by Mike Saradeth on 11/3/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class ProductViewModel: NSObject, LoadImageService {
    var products: [Product]!
    private var productService: ProductService!
    
    init(products: [Product], productService: ProductService) {
        self.products = products
        self.productService = productService
    }
    
    func loadData(completion: @escaping ()->()) {
        DispatchQueue.global(qos: .userInteractive).async {
            self.productService.loadProduct { [weak self] (products) in
                self?.products = products
                completion()
            }
        }
    }
    
    func loadImage(urlString: String, completion: @escaping (UIImage?)->()) {
        loadImageService(urlString: urlString, completion: completion)
    }
}
