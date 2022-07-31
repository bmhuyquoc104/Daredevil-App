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
//  ContentView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 26/07/2022.
//

import SwiftUI

struct HomeView: View {
    // State variable to check the current tab selection
    @State private var tabSelection = 1
    // Initializer delegation
    init() {
        // Customize the tab bar for the whole app
        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance.init(idiom: .unspecified)
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color("white"))
        UITabBar.appearance().barTintColor = UIColor(Color("Pink Raspberry"))
    }
    var body: some View {
        // Create tabview for display purposes
        TabView(selection:$tabSelection){
            //  Main feature character view
            FeaturedCharacterView().tabItem {
                VStack{
                    Image(systemName: "photo.circle")
                        .resizable()
                    Text("Characters").foregroundColor(Color("white"))
                }
            }.tag(1)
            //  Comics display by list
            ComicsListView().tabItem {
                VStack{
                    Image(systemName: "book.circle").foregroundColor(.red)
                    Text("Comics").foregroundColor(Color("white"))
                    
                }
            }.tag(2)
            // BookStore display by list
            BookStoresListView(tabSelection: $tabSelection).tabItem {
                VStack{
                    Image(systemName:"location.circle")
                    Text("Store").foregroundColor(Color("white"))
                }
            }.tag(3)
        }.accentColor(Color("Pink Raspberry"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
