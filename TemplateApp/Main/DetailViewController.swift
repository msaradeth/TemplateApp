//
//  DetailViewController.swift
//  TemplateApp
//
//  Created by Mike Saradeth on 11/3/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var product: Product!
    var viewModel: ProductViewModel!
    
    static func create(with product: Product, viewModel: ProductViewModel) -> DetailViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.product = product
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = product.description
        priceLabel.text = "$\(product.price.description)"
        viewModel.loadImage(urlString: product.imageUrlString) { (image) in
            DispatchQueue.main.async { [weak self] in
                self?.productImage.image = image
            }
        }
    }
}
