//
//  ViewController.swift
//  Bebiller
//
//  Created by Zeynep Özdemir Açıkgöz on 31.05.2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: ProductViewController())
        let vc3 = UINavigationController(rootViewController: AcademicViewController())
        let vc4 = UINavigationController(rootViewController: CommunicationViewController())
        let vc5 = UINavigationController(rootViewController: OfferViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "stethoscope")
        vc3.tabBarItem.image = UIImage(systemName: "books.vertical.circle")
        vc4.tabBarItem.image = UIImage(systemName: "phone.and.waveform")
        vc5.tabBarItem.image = UIImage(systemName: "chart.bar.doc.horizontal")
        
        vc1.title = "Home"
        vc2.title = "Products"
        vc3.title = "Academic"
        vc4.title = "Communication"
        vc5.title = "Offer"
        
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
        
    }

    

}

