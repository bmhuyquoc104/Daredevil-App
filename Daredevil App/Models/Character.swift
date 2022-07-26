//
//  Character.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 26/07/2022.
//

import Foundation

struct Character: Decodable,Identifiable {
    var id :Int
    var description: String
    var name: String
    var image: String
    
}
