//
//  TitleProductCollectionViewCell.swift
//  Bebiller
//
//  Created by Zeynep Özdemir Açıkgöz on 1.08.2023.
//

import UIKit

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
    
    public func configure(with model: String) {
        guard let image = URL(string: categories[0].image) else {return}
        productImageView.sd_setImage(with: image, completed: nil)
    }
    
}
