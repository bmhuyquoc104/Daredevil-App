//
//  BookStore.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 29/07/2022.
//

import Foundation

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
    
    func testBookStore () -> BookStore {
        let bookStore = BookStore(id: 1, lat: 10.7670192, lng: 106.6813071, title: "Ca Chep BookStore", image: "ns-cachep", address: "223 Nguyen Thi Minh Khai Street, Ward Nguyen Cu Trinh, District 1, HCM City", rating: "4.5", hours: "08:00 - 22:00", phone: "028 392 500 69")
        return bookStore
    }
}
