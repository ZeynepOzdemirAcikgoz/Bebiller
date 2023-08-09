//
//  EducationCollectionViewTableViewCell.swift
//  Bebiller
//
//  Created by Zeynep Özdemir Açıkgöz on 1.06.2023.
//

import UIKit

class AcademicCollectionViewTableViewCell: UITableViewCell {

    static let identifier = "AcademicCollectionViewTableViewCell"
    
    private let productsNameLabel: UILabel = {
        let label = UILabel()
        //temelde kullanılacak içerik otomatik düzeni etkinleştiriyorum
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let productsUIImageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        
        //hücreeler için içerik elkliyoruz
        contentView.addSubview(productsUIImageView)
        //içerik görünüm etiketi etkliyoruz
        contentView.addSubview(productsNameLabel)
        applyConstraints()
    }
    
    
    
    private func applyConstraints(){
        let productsUIImageViewConstraints = [
            productsUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productsUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            productsUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            productsUIImageView.widthAnchor.constraint(equalToConstant: 80),
            productsUIImageView.heightAnchor.constraint(equalToConstant: 80)
        ]
        let productsNameLabelConstraints = [
        
            productsNameLabel.leadingAnchor.constraint(equalTo: productsUIImageView.trailingAnchor, constant: 20),
            productsNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
      
        NSLayoutConstraint.activate(productsUIImageViewConstraints)
        NSLayoutConstraint.activate(productsNameLabelConstraints)
       
        
    }
    
    //image görüntüleme ayarları
    public func configure(with model: ProductsModel){
     
        
        guard let url = URL(string: model.image) else {
            return
            
        }
        
        productsUIImageView.sd_setImage(with: url, completed: nil)
        productsNameLabel.text = model.name
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
