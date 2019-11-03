//
//  TestProductViewModel.swift
//  TemplateAppTests
//
//  Created by Mike Saradeth on 11/3/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import XCTest
@testable import TemplateApp

class TestProductViewModel: XCTestCase {
    var subject: ProductViewModel!
    var fakeProductService: FakeProductService!
    var fakeLoadImageService: FakeLoadImageService!
    
    override func setUp() {
        super.setUp()        
        fakeProductService = FakeProductService()
        fakeLoadImageService = FakeLoadImageService()
        subject = ProductViewModel(products: [], productService: fakeProductService, loadImageService: fakeLoadImageService)
    }

    override func tearDown() {
        subject = nil
        fakeProductService = nil
        fakeLoadImageService = nil
        super.tearDown()
    }

    func testLoadData() {
        subject.loadData {}
        XCTAssertEqual(fakeProductService.loadProductCallCount, 1)
    }

    func testLoadImage() {
        subject.loadImage(urlString: "image-url-string") { (image) in }
        XCTAssertEqual(fakeLoadImageService.loadImageServiceCallCount, 1)
        XCTAssertEqual(fakeLoadImageService.loadImageServiceArgsCallIndex(0), "image-url-string")
    }
}
