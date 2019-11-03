//
//  FakeLoadImageService.swift
//  TemplateAppTests
//
//  Created by Mike Saradeth on 11/3/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit
@testable import TemplateApp

class FakeLoadImageService: LoadImageService {
    var loadImageServiceCallCount = 0
    private var loadImageServiceArgs = [String]()
    func loadImageServiceArgsCallIndex(_ index: Int) -> String {
        return loadImageServiceArgs[index]
    }
    override func loadImageService(urlString: String, completion: @escaping (UIImage?) -> ()) {
        loadImageServiceCallCount += 1
        loadImageServiceArgs.append(urlString)
    }
}
