/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Your name (e.g. Võ Quốc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 26/07/2022)
 Last modified: dd/mm/yyyy (e.g. 27/07/2022)
 */

//
//  FeaturedCharacterView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 26/07/2022.
//

import SwiftUI

struct FeaturedCharacterView: View {
    // Declare the character from the environment object passing in the top view
    @EnvironmentObject var characterModel: CharacterModel
    // State to check the selected tab
    @State var selectedTab = 0
    
    // Function to set up the appearance of the ui page control
    func setupAppearance() {
        // Color for current page indicator
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color("Pink Raspberry"))
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    var body: some View {
        VStack{
            // Tabview to display all the characters
            TabView(selection: $selectedTab){
                ForEach(0..<characterModel.characters.count, id:\.self){
                    index in
                    CharacterCardView(character: characterModel.characters[index]).tag(index+1)
                }
            }
            // Choose the tabviewstyle
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            // Call the set up appearance when it appears
            .onAppear{
                setupAppearance()
            }
        }
    }
}

struct FeaturedCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCharacterView()
    }
}
