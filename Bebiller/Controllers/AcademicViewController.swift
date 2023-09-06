//
//  EducationViewController.swift
//  Bebiller
//
//  Created by Zeynep Özdemir Açıkgöz on 31.05.2023.
//

import UIKit

class AcademicViewController: UIViewController {
    
    private var processedData : [CategoryModel] = [CategoryModel]()
    // var productNameArray = [String]()
    
    private let educationFeedTable: UITableView = {
        let table = UITableView()
        table.register(AcademicCollectionViewTableViewCell.self, forCellReuseIdentifier: AcademicCollectionViewTableViewCell.identifier)
        return table
        
    }()
    
    //var productNameArray = [ProductsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Academic"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.backgroundColor = .systemBackground
        view.addSubview(educationFeedTable)
        educationFeedTable.dataSource = self
        educationFeedTable.delegate = self
        
        getDataFromFirebase()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        educationFeedTable.frame = view.bounds
    }
    
    
     // verileri alma
    func getDataFromFirebase() {
        DataManager.shared.fetchDataFromFirebase{[weak self] categories in
          
            self?.processedData = categories
       
            self?.educationFeedTable.reloadData() // Tabloyu güncelle
        }
        educationFeedTable.delegate = self
        educationFeedTable.dataSource = self
    }
}
    
extension AcademicViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  processedData.count // Verilerin sayısı
    }
    
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AcademicCollectionViewTableViewCell.identifier, for: indexPath) as?
                AcademicCollectionViewTableViewCell else {
            return UITableViewCell()
        }

    let category = processedData[indexPath.row]
        cell.configure(with: ProductsModel(categoryId: category.id ?? "", description: category.products?.description ?? "", image: category.image ?? "", name: category.name ?? ""))
//        cell.textLabel?.text = category.name
//        cell.imageView?.image = UIImage(named: category.image)

                return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
}
