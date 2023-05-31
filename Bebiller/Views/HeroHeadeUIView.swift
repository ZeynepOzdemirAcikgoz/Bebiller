//
//  HeroHeadeUIView.swift
//  Bebiller
//
//  Created by Zeynep Özdemir Açıkgöz on 31.05.2023.
//

import UIKit

class HeroHeadeUIView: UIView {
    
//    private let communicationButon: UIButton = {
//        let button = UIButton()
//        button.setTitle("Communication", for: .normal)
//        button.layer.borderColor = UIColor.white.cgColor
//        button.layer.borderWidth = 1
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
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
                                 UIColor.systemMint.cgColor]
        
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
        
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
//        addSubview(communicationButon)
//        applyConstraints()
    }
    
//    private func applyConstraints() {
//
//        let communicationButonConstraints = [
//            communicationButon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
//            communicationButon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
//              communicationButon.widthAnchor.constraint(equalTo: 100)
//
//        ]
//        NSLayoutConstraint.activate(communicationButonConstraints)
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
