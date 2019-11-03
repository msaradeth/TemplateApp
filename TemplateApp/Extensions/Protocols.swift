//
//  Protocols.swift
//  TemplateApp
//
//  Created by Mike Saradeth on 11/3/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit


protocol LoadImageService {
    func loadImageService(urlString: String, completion: @escaping (UIImage?)->())
}
extension LoadImageService {
    func loadImageService(urlString: String, completion: @escaping (UIImage?)->()) {
        DispatchQueue.global(qos: .userInteractive).async {
            guard let url = URL(string: urlString),
                let data = try? Data(contentsOf: url),
                let image = UIImage(data: data) else { return }
            completion(image)
        }
    }
}
