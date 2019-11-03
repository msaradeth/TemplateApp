//
//  TestListViewController.swift
//  TemplateAppTests
//
//  Created by Mike Saradeth on 11/3/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import XCTest
@testable import TemplateApp

struct PerformSegueInfo {
    var identifier: String?
    var sender: AnyObject?
    var callCount: Int = 0
    var popToRootCallCount: Int = 0
    var popToViewControllerCallCount: Int = 0
    var popToViewControllerArgs = [(UIViewController, Bool)]()
}

private var performSegueInfo: PerformSegueInfo!
extension ListViewController {
    override open func performSegue(withIdentifier identifier: String, sender: Any?) {
        performSegueInfo.identifier = identifier
        performSegueInfo.callCount += 1
        performSegueInfo.sender = sender as AnyObject?
    }
}

class TestListViewController: XCTestCase {
    var subject: ListViewController!
    var fakeViewModel: FakeProductViewModel!
    var product1: Product!
    var product2: Product!
    var products: [Product]!
    
    override func setUp() {
        super.setUp()
        product1 = Product(id: "12345", name: "mango", description: "Ripe mango with hints of tropical fruit.", price: 299, thumbnailUrlString: "https://s3.us-east-2.amazonaws.com/juul-coding-challenge/images/mango_thumbnail.png", imageUrlString: "https://s3.us-east-2.amazonaws.com/juul-coding-challenge/images/mango_hires.png")
        product2 = Product(id: "1111", name: "cool mint", description: "Crisp peppermint with a soothing aftertaste.", price: 185, thumbnailUrlString: "https://s3.us-east-2.amazonaws.com/juul-coding-challenge/images/mint_thumbnail.png", imageUrlString: "https://s3.us-east-2.amazonaws.com/juul-coding-challenge/images/mint_hires.png")
        products = [product1, product2]
        
        fakeViewModel = FakeProductViewModel(products: products, productService: ProductService(), loadImageService: LoadImageService())
        
        subject = ListViewController.create(with: fakeViewModel)
        UIApplication.shared.keyWindow?.rootViewController = subject
    }

    override func tearDown() {
        subject = nil
        fakeViewModel = nil
        product1 = nil
        product2 = nil
        products = nil
        super.tearDown()
    }
    
    func testCreate() {
        XCTAssertNotNil(subject.view)
        XCTAssertEqual(subject.viewModel, fakeViewModel)
    }

    func testViewDidLoad() {
        subject.viewDidLoad()
        XCTAssertEqual(fakeViewModel.products, products)
        XCTAssertEqual(fakeViewModel.products[0].id, "12345")
        XCTAssertEqual(fakeViewModel.products[0].name, "mango")
    }
    
    func testNumberOfRowsInSection() {
        let numberOfRows = subject.tableView(subject.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 2)
    }
    
    func testCellForRowAt() {
        let cell = subject.tableView(subject.tableView, cellForRowAt: IndexPath(item: 1, section: 0)) as! ListTableViewCell
        XCTAssertEqual(cell.nameLabel.text, "cool mint")
        XCTAssertEqual(cell.descriptionLabel.text, "Crisp peppermint with a soothing aftertaste.")
    }
    
    func testDidSelectRowAt() {
        performSegueInfo = PerformSegueInfo()
        let indexPath = IndexPath(item: 1, section: 0)
        subject.tableView(subject.tableView, didSelectRowAt: indexPath)
        XCTAssertNotEqual(subject.tableView.indexPathForSelectedRow, indexPath)
        XCTAssertEqual(performSegueInfo.callCount, 1)
        XCTAssertEqual(performSegueInfo.identifier, "ListOutDetailIn")
    }
}
