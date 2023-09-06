//
//  ProductCollectionViewTableViewCell.swift
//  Bebiller
//
//  Created by Zeynep Özdemir Açıkgöz on 31.05.2023.
//

import UIKit
import SDWebImage

protocol ProductCollectionViewTableViewCellDelegate: AnyObject{
    func productcollectionViewTableViewCellDidTapCell(_cell: ProductCollectionViewTableViewCell, viewModel: ProductPreviewViewModel)

}

class ProductCollectionViewTableViewCell: UITableViewCell {


    static let identifier = "CollectionViewTableViewCell"
    weak var delegate: ProductCollectionViewTableViewCellDelegate?
    private var titlesCategory: [CategoryModel] = [CategoryModel]()
    
    var items: [ProductsModel] = [ProductsModel]()
    
    
    private let collectionView: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleProductCollectionViewCell.self, forCellWithReuseIdentifier: TitleProductCollectionViewCell.identifier)
        return collectionView
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
        
    }
    public func configure(with category: [CategoryModel]){
        self.titlesCategory = category
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
            
        }
    }
    

    }

extension ProductCollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titlesCategory.count
      
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleProductCollectionViewCell.identifier, for: indexPath) 
        
            
        let categoryName = titlesCategory[indexPath.section].name
       // let item = titlesCategory[indexPath.section].products?[indexPath.row]
        
        // Hücre içeriğini ayarla (örneğin, item'ın ismi gibi)
           //cell.textLabel?.text = item.name
            
            return cell
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        cell.backgroundColor = .red
//        return cell
        
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleProductCollectionViewCell.identifier, for: indexPath) as? TitleProductCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//        guard let model = titlesCategory[indexPath.row].image else {
//            return UICollectionViewCell()
//        }
        
        
        
//        for model in titlesCategory[indexPath.row].products {
//            cell.configure(with: model)
//        }

            
        
      

    }
   
}

