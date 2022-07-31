/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Your name (e.g. Võ Quốc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 30/07/2022)
 Last modified: dd/mm/yyyy (e.g. 30/07/2022)
 */

//
//  Coordinate.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 30/07/2022.
//

import Foundation
import MapKit
import SwiftUI

// PointOfInterest model
// Add decodable and identifiable type for decode from json and load to the model

struct PointOfInterest: Identifiable {
    // 2.
    let id: Int
    let name: String
    let latitude: Double
    let longitude: Double
    
    // 3.
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
    }
    
    // Function to get the coordinate from the bookstore data
    static func getCoordinate(array:[BookStore]) -> [PointOfInterest] {
        var newArr = [PointOfInterest]()
        for item in array {
            newArr.append(PointOfInterest(id:item.id,name: item.address, latitude: item.lat, longitude: item.lng))
        }
        return newArr
    }
}
