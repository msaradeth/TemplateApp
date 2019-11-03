//
//  ProductViewModel.swift
//  TemplateApp
//
//  Created by Mike Saradeth on 11/3/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class ProductViewModel: NSObject {
    var products: [Product]!
    private var productService: ProductService!
    private var loadImageService: LoadImageService!
    
    init(products: [Product], productService: ProductService, loadImageService: LoadImageService) {
        self.products = products
        self.productService = productService
        self.loadImageService = loadImageService
    }
    
    func loadData(completion: @escaping ()->()) {
        self.productService.loadProduct { [weak self] (products) in
            self?.products = products
            completion()
        }
    }
    
    func loadImage(urlString: String, completion: @escaping (UIImage?)->()) {
        loadImageService.loadImageService(urlString: urlString, completion: completion)
    }
}
