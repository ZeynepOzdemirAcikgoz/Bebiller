//
//  TitleProductCollectionViewCell.swift
//  Bebiller
//
//  Created by Zeynep Özdemir Açıkgöz on 1.08.2023.
//

import UIKit
import SDWebImage

class TitleProductCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleProductCollectionViewCell"
    
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(productImageView)
    }
    required init(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        productImageView.frame = contentView.bounds
    }
    
    //product ımageları firebase den çekiyoruz
    
    public func configure(with model: ProductsModel){
        guard let url = URL(string: model.image) else {
            return
            
        }
        productImageView.sd_setImage(with: url, completed: nil)
        
    }
}
