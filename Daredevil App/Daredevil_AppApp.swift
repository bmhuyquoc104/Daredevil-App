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
