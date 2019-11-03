//
//  ListTableViewCell.swift
//  TemplateApp
//
//  Created by Mike Saradeth on 11/3/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbNailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(product: Product, viewModel: ProductViewModel) {
        nameLabel.text = product.name
        descriptionLabel.text = product.description
        viewModel.loadImage(urlString: product.thumbnailUrlString, completion: { (image) in
            DispatchQueue.main.async { [weak self] in
                self?.thumbNailImage.image = image
            }
        })
    }
}

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
