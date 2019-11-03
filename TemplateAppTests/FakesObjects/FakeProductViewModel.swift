//
//  FakeProductViewModel.swift
//  TemplateAppTests
//
//  Created by Mike Saradeth on 11/3/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit
@testable import TemplateApp

class FakeProductViewModel: ProductViewModel {    
    var loadDataCallCount = 0
    override func loadData(completion: @escaping ()->()) {
        loadDataCallCount += 1
    }
    
    var loadImageCallCount = 0
    private var loadImageArgs = [String]()
    func loadImageArgsForCallIndex(index: Int) -> String {
        return loadImageArgs[index]
    }
    override func loadImage(urlString: String, completion: @escaping (UIImage?) -> ()) {
        loadImageCallCount += 1
        loadImageArgs.append(urlString)
    }
}
