//
//  HeroHeadeUIView.swift
//  Bebiller
//
//  Created by Zeynep Özdemir Açıkgöz on 31.05.2023.
//

import UIKit

class HeroHeadeUIView: UIView {
    

    
    private let heroImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "IMG_6800")
        return imageView
    }()
    
    private func addGradient(){
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ UIColor.clear.cgColor,
                                 UIColor.white.cgColor]
        
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
        
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()

    }
    

    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
