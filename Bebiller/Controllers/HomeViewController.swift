//
//  HomeViewController.swift
//  Bebiller
//
//  Created by Zeynep Özdemir Açıkgöz on 31.05.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
   
   

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        configureNavbar()
      
        let homeHeaderView = HomeHeaderUIView(frame: CGRect(x: 10, y: 110, width: view.bounds.width, height: view.bounds.height))
        view.addSubview(homeHeaderView)
       
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    

}
