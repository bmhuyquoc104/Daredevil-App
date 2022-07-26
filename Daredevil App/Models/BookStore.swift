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

//
//  BookStore.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 29/07/2022.
//

import Foundation
import CoreLocation

// BookStore model
// Add decodable and identifiable type for decode from json and load to the model
struct BookStore:Identifiable,Decodable {
    var id:Int
    var lat:Double
    var lng:Double
    var title:String
    var image:String
    var address:String
    var rating:String
    var hours:String
    var phone:String
    var comics:[ComicsInBookStore]
    
    // Function to generate dummy data for testing in single view
    static func testBookStore () -> BookStore {
        let comic1 = ComicsInBookStore(id: 1, title: "Devil's Reign (2021) #6", image: "cm-dr#1")
        let comic2 = ComicsInBookStore(id: 2, title: "Devil's Reign (2021) #1", image: "cm-dr#6")
        let comics = [comic1,comic2]
        let bookStore = BookStore(id: 1, lat: 10.7670192, lng: 106.6813071, title: "Ca Chep BookStore", image: "ns-cachep", address: "223 Nguyen Thi Minh Khai Street, Ward Nguyen Cu Trinh, District 1, HCM City", rating: "4.5", hours: "08:00 - 22:00", phone: "028 392 500 69",comics: comics)
        return bookStore
    }
}

// ComicsInBookStore model to represent the ComicsInBookStore object in the bookstore model
// Add decodable type for decode from json and load to the model
struct ComicsInBookStore: Identifiable,Decodable{
    var id:Int
    var title:String
    var image:String
}
