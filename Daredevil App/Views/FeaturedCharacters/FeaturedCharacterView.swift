//
//  FeaturedCharacterView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 26/07/2022.
//

import SwiftUI

struct FeaturedCharacterView: View {
    @EnvironmentObject var characterModel: CharacterModel
    @State var selectedTab = 0
    func setupAppearance() {
       UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color("secondary"))
       UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
     }
    
   
    
    var body: some View {
        VStack{
         
            TabView(selection: $selectedTab){
                ForEach(0..<characterModel.characters.count, id:\.self){
                    index in
                    CharacterCardView(character: characterModel.characters[index]).tag(index+1)
                }
              
            }
           
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
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
