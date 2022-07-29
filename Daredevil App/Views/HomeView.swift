//
//  ContentView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 26/07/2022.
//

import SwiftUI

struct HomeView: View {
    @State private var tabSelection = 1
    init() {
        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance.init(idiom: .unspecified)
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color("white"))
        UITabBar.appearance().barTintColor = UIColor(Color("secondary"))
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
            // ComicStore display by list
            BookStoresListView(tabSelection: $tabSelection).tabItem {
                VStack{
                    Image(systemName:"location.circle")
                    Text("Store").foregroundColor(Color("white"))

                    
                    
                }
            }.tag(3)
        }.accentColor(Color("secondary"))
        
        
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
