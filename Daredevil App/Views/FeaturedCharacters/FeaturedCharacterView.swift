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
                ForEach(0..<characterModel.characters.count){
                    index in
                    VStack{
                        Image(characterModel.characters[index].image).resizable().cornerRadius(10).shadow(radius: 5).frame(width: 200, height: 250).aspectRatio(contentMode: .fit)
                        Text(characterModel.characters[index].name).foregroundColor(.white)
                    }
                    
                }
              
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }.background(Color("primary"))
    }
}

struct FeaturedCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCharacterView()
    }
}
