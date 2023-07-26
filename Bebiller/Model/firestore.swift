//
//  firestore.swift
//  Bebiller
//
//  Created by Zeynep Özdemir Açıkgöz on 26.07.2023.
//


//
//  DataManager.swift
//  Bebiller
//
//  Created by Zeynep Özdemir Açıkgöz on 20.07.2023.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

let database = Firestore.firestore()

var categories: [CategoryModel] = []


enum FirestoreError: Error{
    
    case failedTogetData
}

/*class DataManager {
    
    public func getDatas()async throws -> CategoryModel{
        let productSnapshot = try await database.collection("Products").getDocuments()
        guard let products = productSnapshot.documents.map(id)
        else{
            print("error")
        }
    }
    
    func getFirebaseData(completion: @escaping ( CategoryModel) -> Void ) {
        
         database.collection("Products").getDocuments(){ (querySnapshot, err) in
                   if let err = err {
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
                      print("Error getting documents: \(catErr)")
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
                  
                      do {
                          let results = try JSONSerialization.jsonObject(with: CategoryModel, options: .fragmentsAllowed)
                          print(results)
                          
                      } catch {
                          print(error.localizedDescription)
                      }
                  }
                  
              }

          }
            
      }
        
    }
    

    

}*/


/**
 
 //  var products: [ProductsModel] = []
   

//        database.collection("Products").getDocuments() { [self] (querySnapshot, err) in
//
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                print("Category => \(categories)")
//                let docs = querySnapshot?.documents.map{d in
//                    products.append(ProductsModel(
//                        categoryId:  d["categoryId"]  as?  String ??  "",
//                        description: d["description"]  as?  String ??  "",
//                        image:  d["image"]  as?  String ??  "",
//                        name: d["name"]  as?  String ??  "",
//                        title:  d["title"]  as?  String ??  ""
//                    ))
//                    return d
//                }
//            }
//        }
 */


/**
 
 
 var categories: [CategoryModel] = []
 
 

 database.collection("Products").getDocuments() { [self](ProductQuerySnapshot, err) in
     
     if let err = err {
         print("Error getting documents: \(err)")
     } else {
         let products: [ProductsModel] = ProductQuerySnapshot?.documents as! [ProductsModel]
         
         database.collection("Category").getDocuments(){[self] (categoryQuerySnapshot,catErr) in
             if let catErr = catErr {
                 print("Error getting documents: \(catErr)")
             } else{
                 categoryQuerySnapshot?.documents.map{c in
                    
                     categories.append(CategoryModel(
                         id: c.documentID,
                         name: c["name"]  as?  String ??  "",
                         image: c["image"]  as?  String ??  "",
                         products: products.filter({$0.categoryId == c.documentID})
                         )
                     )
                 }
                 print(categories)
             }
         }
     }
 }
 
 */
