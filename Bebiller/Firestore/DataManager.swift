//
//  DataManager.swift
//  Bebiller
//
//  Created by Zeynep Özdemir Açıkgöz on 20.07.2023.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

//private let database = Firestore.firestore()

var categories: [CategoryModel] = []
var products: [ProductsModel] = []

enum FirestoreError: Error{
    
    case failedTogetData
}



class DataManager {
    static let shared = DataManager()

    private let database = Firestore.firestore()

    func fetchDataFromFirebase(completion: @escaping ([CategoryModel]) -> Void) {
        let dispatchGroup = DispatchGroup()
        var categories: [CategoryModel] = []

        dispatchGroup.enter()
        
        database.collection("Category").getDocuments(){ (categorySnapshot,catErr) in
            if let error = catErr {
                print("Hata alındı: \(error)")
                dispatchGroup.leave()
                return
            } else{
                for c in categorySnapshot!.documents {
                    

                    dispatchGroup.enter()
                    self.fetchProductsForCategory(categoryId: c.documentID) { ProductList in
                        let newCategory = CategoryModel(
                            id: c.documentID,
                            name: c["name"]  as?  String ??  "",
                            image: c["image"]  as?  String ??  "",
                            products: ProductList
                            )
                        categories.append(newCategory)
                        dispatchGroup.leave()
                    }
                }
            }
            
            dispatchGroup.leave()

    }
        
        dispatchGroup.notify(queue: .main) {
            completion(categories)
        }
        
    }

     private func fetchProductsForCategory(categoryId: String, completion: @escaping ([ProductsModel]) -> Void) {
        var products: [ProductsModel] = []

        print("CATEGORYID=> \(categoryId)")
        database.collection("Products").whereField("categoryId", isEqualTo: categoryId).getDocuments() { (querySnapshot, err) in
            if let error = err {
                print("Hata alındı: \(error)")
                completion([])
                return
            } else {
                for productDocument in querySnapshot!.documents {
                        let newProduct = ProductsModel(
                            categoryId: productDocument["categoryId"]  as?  String ??  "",
                            description: productDocument["description"]  as?  String ??  "",
                            image: productDocument["image"]  as?  String ??  "",
                            name: productDocument["name"]  as?  String ??  "",
                            title: productDocument["title"]  as?  String ??  ""
                        )
                        products.append(newProduct)
                    
                }
                completion(products)
          }
        }
    }
}

/*class DataManager {
    static let shared = DataManager()

    private let db = Firestore.firestore()

    func fetchDataFromFirebase(completion: @escaping ([String]) -> Void) {
        let dispatchGroup = DispatchGroup()
        var processedData: [String] = []

        dispatchGroup.enter()
        db.collection("collection1").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Hata alındı: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    if let name = document.data()["name"] as? String,
                       let categoryId = document.data()["categoryId"] as? String {
                        let processedName = "\(name) (Category: \(categoryId))"
                        processedData.append(processedName)
                    }
                }
            }
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        db.collection("collection2").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Hata alındı: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    if let name = document.data()["name"] as? String,
                       let categoryId = document.data()["categoryId"] as? String {
                        let processedName = "\(name) (Category: \(categoryId))"
                        processedData.append(processedName)
                    }
                }
            }
            dispatchGroup.leave()
        }

        dispatchGroup.notify(queue: .main) {
            completion(processedData)
        }
    }

    

    func getFirebaseData(callback: @escaping (Result<[CategoryModel], Error >) -> Void ){

        database.collection("Products").getDocuments() { (querySnapshot, err) in
          if let err = err {
              callback(.failure(err))
              print("Error getting documents: \(err)")
          } else {
              let products = querySnapshot?.documents.map{d in
                  return ProductsModel(
                      categoryId:  d["categoryId"]  as?  String ??  "",
                      description: d["description"]  as?  String ??  "",
                      image:  d["image"]  as?  String ??  "",
                      name: d["name"]  as?  String ??  "",
                      title:  d["title"]  as?  String ??  ""
                  )
              }

              database.collection("Category").getDocuments(){ (categoryQuerySnapshot,catErr) in
                  if let catErr = catErr {
                      callback(.failure(catErr))
                  } else{
                      categoryQuerySnapshot?.documents.map{c in

                          categories.append(CategoryModel(
                              id: c.documentID,
                              name: c["name"]  as?  String ??  "",
                              image: c["image"]  as?  String ??  "",
                              products: products!.filter({$0.categoryId == c.documentID})
                              )
                          )
                      }
                      print(categories)
                      print(products)
                  }
              }
              callback((categories as? Result<[CategoryModel], Error >)!)
          }
      }


    }




}*/
