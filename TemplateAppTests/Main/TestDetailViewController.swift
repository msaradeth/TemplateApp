//
//  TestDetailViewController.swift
//  TemplateAppTests
//
//  Created by Mike Saradeth on 11/3/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import XCTest
@testable import TemplateApp

class TestDetailViewController: XCTestCase {
    var subject: DetailViewController!
    var product: Product!
    var fakeProductViewModel: FakeProductViewModel!
    
    override func setUp() {
        super.setUp()
        product = Product(id: "12345", name: "mango", description: "Ripe mango with hints of tropical fruit.", price: 299, thumbnailUrlString: "https://s3.us-east-2.amazonaws.com/juul-coding-challenge/images/mango_thumbnail.png", imageUrlString: "https://s3.us-east-2.amazonaws.com/juul-coding-challenge/images/mango_hires.png")
        fakeProductViewModel = FakeProductViewModel(products: [], productService: ProductService(), loadImageService: LoadImageService())
        subject = DetailViewController.create(with: product, viewModel: fakeProductViewModel)
        
        UIApplication.shared.keyWindow?.rootViewController = subject
    }
    
    override func tearDown() {
        product = nil
        fakeProductViewModel = nil
        subject = nil
    }
    
    func testCreate() {
        XCTAssertNotNil(subject.view)
        XCTAssertEqual(subject.viewModel, fakeProductViewModel)
        XCTAssertEqual(subject.product, product)        
    }
    
    func testViewDidLoad() {
        subject.viewDidLoad()
        XCTAssertEqual(fakeProductViewModel.loadImageArgsForCallIndex(index: 0), product.imageUrlString)
        XCTAssertEqual(subject.descriptionLabel.text, product.description)
        XCTAssertEqual(subject.priceLabel.text, "$\(product.price.description)")
    }
}
