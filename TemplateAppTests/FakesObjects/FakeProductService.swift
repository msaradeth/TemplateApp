//
//  FakeProductService.swift
//  TemplateAppTests
//
//  Created by Mike Saradeth on 11/3/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
@testable import TemplateApp

class FakeProductService: ProductService {
    typealias LoadProductType = ([Product])->()
    
    var loadProductCallCount = 0
    private var loadProductArgs = [LoadProductType]()
    public func loadProductArgsForCall(_ index: Int) -> LoadProductType {
        return loadProductArgs[index]
    }
    override func loadProduct(complectionHandler: @escaping LoadProductType) {
        loadProductCallCount += 1
        loadProductArgs.append(complectionHandler)
    }
}
