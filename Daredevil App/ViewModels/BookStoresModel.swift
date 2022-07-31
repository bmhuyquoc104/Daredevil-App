//
/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Your name (e.g. Võ Quốc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 29/07/2022)
 Last modified: dd/mm/yyyy (e.g. 29/07/2022)
 */

//  BookStoresModel.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 29/07/2022.
//

import Foundation
import CoreLocation

class BookStoreModel: ObservableObject{
    // Published variable for tracking change when it occur for bookstore array and current book store
    @Published var bookstores  = [BookStore]()
    @Published var currentBookStore:BookStore?
    
    // Initializer delegation
    init (){
        getBookStore()
    }
    
    // Function to get the comic detail data from local
    func getBookStore () {
        // Create path
        let pathString = Bundle.main.path(forResource: "Bookstore", ofType: "json")
        
        // Check optional
        if let path = pathString {
            // Create url
            let url = URL(fileURLWithPath: path)
            // Use do catch to handle optional value data
            do {
                // Create data
                let data = try Data(contentsOf: url)
                // Create decoder
                let decoder = JSONDecoder()
                do {
                    // Create arr to store decoded value from data
                    let bookstoresArr = try decoder.decode([BookStore].self, from: data)
                    
                    
                    
                    // Load the data to the published variable
                    bookstores = bookstoresArr
                } catch  {
                    print("Can not decode data")
                }
            } catch  {
                print("Can not load data from url")
            }
            
        }
    }
    
    // Function to get current book store
    func getCurentBookStore (id:Int){
        for bookStore in bookstores {
            if bookStore.id == id {
                currentBookStore = bookStore
                break
            }
        }
    }
}
