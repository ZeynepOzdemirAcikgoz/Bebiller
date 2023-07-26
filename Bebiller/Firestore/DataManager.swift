////
////  APICaller.swift
////  Bebiller
////
////  Created by Zeynep Özdemir Açıkgöz on 20.07.2023.
////
//
//import Foundation
//import FirebaseFirestore
//
//let database = Firestore.firestore()
//
//var categories: [CategoryModel] = []
//
//class APICaller {
//
//    static let shared = APICaller()
//
//    func getFirebaseData {
//
//        database.collection("Products").getDocuments() { (querySnapshot, err) in
//          if let err = err {
//              print("Error getting documents: \(err)")
//          } else {
//              let products = querySnapshot?.documents.map{d in
//                  return ProductsModel(
//                      categoryId:  d["categoryId"]  as?  String ??  "",
//                      description: d["description"]  as?  String ??  "",
//                      image:  d["image"]  as?  String ??  "",
//                      name: d["name"]  as?  String ??  "",
//                      title:  d["title"]  as?  String ??  ""
//                  )
//              }
//
//              database.collection("Category").getDocuments(){ (categoryQuerySnapshot,catErr) in
//                  if let catErr = catErr {
//                      print("Error getting documents: \(catErr)")
//                  } else{
//                      categoryQuerySnapshot?.documents.map{c in
//
//                          categories.append(CategoryModel(
//                              id: c.documentID,
//                              name: c["name"]  as?  String ??  "",
//                              image: c["image"]  as?  String ??  "",
//                              products: products!.filter({$0.categoryId == c.documentID})
//                              )
//                          )
//                      }
//                  }
//              }
//          }
//      }
//
//
//    }
//
//
//
//
//}
