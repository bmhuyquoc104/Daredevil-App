//
//  Coordinate.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 30/07/2022.
//

import Foundation
import MapKit
import SwiftUI

// 1. & 4.
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
    
    static func getCoordinate(array:[BookStore]) -> [PointOfInterest] {
        var newArr = [PointOfInterest]()
        for item in array {
            newArr.append(PointOfInterest(id:item.id,name: item.address, latitude: item.lat, longitude: item.lng))
        }
        return newArr
    }
}
