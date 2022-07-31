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
//  Daredevil_AppApp.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 26/07/2022.
//

import SwiftUI

@main
struct Daredevil_AppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
            // Assign environment object to the top roof and will be use later by other views at the deeper level
                .environmentObject(CharacterModel())
                .environmentObject(ComicsModel())
                .environmentObject(BookStoreModel())
        }
    }
}
