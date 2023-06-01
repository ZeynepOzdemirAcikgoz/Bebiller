//
//  HomeHeaderUIView.swift
//  Bebiller
//
//  Created by Zeynep Özdemir Açıkgöz on 1.06.2023.
//

import UIKit

class HomeHeaderUIView: UIView {
    
    private let homeImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "download")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var homeTitlelabel : UILabel = {
        let label = UILabel()
        label.text = "Hayat Kurtaran Ürünler Üretir"
        label.font = .systemFont(ofSize: 25, weight: .thin)
        
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(homeImageView)
        addSubview(homeTitlelabel)
        applyConstraints()
    }
    
    

    
    private func applyConstraints(){
        let homeImageViewConstraints = [
            homeImageView.topAnchor.constraint(equalTo:topAnchor, constant:100),
            homeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            homeImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            homeImageView.widthAnchor.constraint(equalToConstant: 180),
            homeImageView.heightAnchor.constraint(equalToConstant: 180)
        ]
        
        let homeTitlelabelConstraints = [
            homeTitlelabel.topAnchor.constraint(equalTo:homeImageView.bottomAnchor, constant: 50),
            homeTitlelabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            homeTitlelabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            //homeTitlelabel.widthAnchor.constraint(equalToConstant: widthAnchor),
            homeTitlelabel.heightAnchor.constraint(equalToConstant: 35)
        ]
        
        NSLayoutConstraint.activate(homeImageViewConstraints)
        NSLayoutConstraint.activate(homeTitlelabelConstraints)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}
