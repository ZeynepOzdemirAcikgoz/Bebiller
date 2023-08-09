//
//  ProductViewController.swift
//  Bebiller
//
//  Created by Zeynep Özdemir Açıkgöz on 31.05.2023.
//

import UIKit
enum Sections: Int {
    case SolunumÜrünleri = 0
    case Kataterler = 1
    case Sondalar = 2
    case Drenler = 3
}

class ProductViewController: UIViewController {
var titlesCategory: [CategoryModel] = [CategoryModel]()
  let sectionTitles: [String] = ["SolunumÜrünleri", "Kataterler", "Sondalar", "Drenler"]
    
   // let sectionTitles: [String] = []
    
  
    private let productFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(ProductCollectionViewTableViewCell.self, forCellReuseIdentifier: ProductCollectionViewTableViewCell.identifier)
        return table
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(productFeedTable)
        
        productFeedTable.delegate = self
        productFeedTable.dataSource = self
        
        //productFeedTable.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 300))
        let headerView = HeroHeadeUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width , height: 300))
        productFeedTable.tableHeaderView = headerView
        
        configureNavbar()
    }
    
    private func configureNavbar(){
        
//        var image = UIImage(named: "logo")
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
//
        
        let navController = navigationController!
        var image = UIImage(named: "logo")
        image = image?.withRenderingMode(.alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        
        let oiButton = UIButton(type: .system)
        oiButton.setImage(UIImage(named: "logo")?.withRenderingMode(.alwaysOriginal), for: .normal)
       // oiButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        oiButton.translatesAutoresizingMaskIntoConstraints = false
        
        let bannerHeight = navController.navigationBar.frame.size.height
        let bannerWidth = bannerHeight + 20
        
        
        let bannerX = bannerWidth / 2 - (image?.size.width)!
        let bannerY = bannerHeight / 2
        oiButton.widthAnchor.constraint(equalToConstant: bannerWidth).isActive = true
        oiButton.heightAnchor.constraint(equalToConstant: bannerHeight).isActive = true
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: oiButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        productFeedTable.frame = view.bounds
    }
    
}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "Hello world"
//        cell.backgroundColor = .yellow
//        return cell
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCollectionViewTableViewCell.identifier, for: indexPath) as? ProductCollectionViewTableViewCell else {
            return UITableViewCell()
        }
       
        
      /*
       switch indexPath.section {
        case Sections.SolunumÜrünleri.rawValue:
            
            DataManager.shared.getFirebaseData { result in
                        switch result {
                        case.success(let titlesCategory):
                            cell.configure(with: titlesCategory)
                        case.failure(let error):
                            print(error.localizedDescription)
                        }
                    }
            
        case Sections.Kataterler.rawValue:
            DataManager.shared.getFirebaseData { result in
                        switch result {
                        case.success(let titlesCategory):
                            cell.configure(with: titlesCategory)
                        case.failure(let error):
                            print(error.localizedDescription)
                        }
                    }
        case Sections.Sondalar.rawValue:
            DataManager.shared.getFirebaseData { result in
                        switch result {
                        case.success(let titlesCategory):
                            cell.configure(with: titlesCategory)
                        case.failure(let error):
                            print(error.localizedDescription)
                        }
                    }
        case Sections.Drenler.rawValue:
            DataManager.shared.getFirebaseData { result in
                        switch result {
                        case.success(let titlesCategory):
                            cell.configure(with: titlesCategory)
                        case.failure(let error):
                            print(error.localizedDescription)
                        }
                    }
        default:
            return UITableViewCell()
        }
       */
//        DataManager.shared.getFirebaseData { result in
//            switch result {
//            case.success(let titlesCategory):
//                cell.configure(with: titlesCategory)
//            case.failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//
      return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header  = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .gray
        header.textLabel?.text = header.textLabel?.text?.uppercased()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
}
