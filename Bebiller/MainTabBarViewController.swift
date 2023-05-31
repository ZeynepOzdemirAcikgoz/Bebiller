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
        let vc3 = UINavigationController(rootViewController: EducationViewController())
        let vc4 = UINavigationController(rootViewController: CommunicationViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "stethoscope")
        vc3.tabBarItem.image = UIImage(systemName: "book.closed")
        vc4.tabBarItem.image = UIImage(systemName: "phone.and.waveform")
        
        vc1.title = "Home"
        vc2.title = "Products"
        vc3.title = "Education"
        vc4.title = "Communication"
        
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        
    }

    

}

