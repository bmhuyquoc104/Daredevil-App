/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Your name (e.g. Võ Quốc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 26/07/2022)
 Last modified: dd/mm/yyyy (e.g. 26/07/2022)
 */

//
//  CharactersModel.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 26/07/2022.
//

import Foundation

class CharacterModel:ObservableObject {
    // Published variable for tracking change when it occur
    @Published var characters:[Character] = [Character]()
    
    // Initializer delegation
    init(){
        getCharactersFromLocal()
    }
    
    // Function to load the character data from local
    func getCharactersFromLocal () {
        // Create path
        let pathString = Bundle.main.path(forResource: "Characters", ofType: "json")
        
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
                    let characterArr = try decoder.decode([Character].self, from: data)
                    
                    // Load the data to the published variable
                    characters = characterArr
                } catch  {
                    print("Can not decode data")
                }
            } catch  {
                print("Can not load data from url")
            }
            
        }
    }
}
