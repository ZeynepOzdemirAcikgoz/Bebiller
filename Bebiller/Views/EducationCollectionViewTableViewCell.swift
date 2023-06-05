//
//  EducationCollectionViewTableViewCell.swift
//  Bebiller
//
//  Created by Zeynep Özdemir Açıkgöz on 1.06.2023.
//

import UIKit

class EducationCollectionViewTableViewCell: UITableViewCell {

    static let identifier = "EducationCollectionViewTableViewCell"
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
