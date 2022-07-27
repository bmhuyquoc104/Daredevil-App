//
//  FeaturedCharacterView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 26/07/2022.
//

import SwiftUI

struct FeaturedCharacterView: View {
    @EnvironmentObject var characterModel: CharacterModel
    
    var body: some View {
        VStack{
         
            TabView(){
                ForEach(0..<characterModel.characters.count, id:\.self){
                    index in
                    CharacterCardView(character: characterModel.characters[index])
                    
                }
              
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

struct FeaturedCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCharacterView()
    }
}
