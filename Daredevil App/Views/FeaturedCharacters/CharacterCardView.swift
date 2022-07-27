//
//  CharacterCardView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 27/07/2022.
//

import SwiftUI

struct CharacterCardView: View {
    
    // Render dynamically by passing character
    var character:Character
    @State var isShowing = false
    var body: some View {
        VStack {
            
            Text(character.realName).bold().font(.system(size: 22)).foregroundColor(Color(character.cardBackground))
            Spacer()
            ZStack(){
                Rectangle().cornerRadius(15).shadow(radius: 5).foregroundColor(Color(character.cardBackground))
                Image(character.image).resizable().aspectRatio(contentMode: .fit).frame(width: 200, height: 250).offset(x: 0, y: -250)
               
                    VStack (alignment:.leading){
                        Text(character.name).foregroundColor(.white).bold().font(.title).padding(.bottom,20).padding(.top,30)
                        Text(character.description).foregroundColor(.white).font(.caption).padding(.bottom,30).lineSpacing(6)
                        HStack{
                            Spacer()
                            Button {
                                self.isShowing.toggle()
                            } label: {
                                VStack(alignment:.center){
                                    Image(systemName: "arrow.up").foregroundColor(Color("white"))
                                    Text("Know More").foregroundColor(Color("white")).bold().font(.system(size: 12))
                                  
                                }
                            }.fullScreenCover(isPresented: $isShowing) {
                                CharacterDetailView(character: character)
                                
                            }
                            
                            Spacer()

                        }.offset(x:0,y:20)
                    }.padding(.all,20)
                
                
            }.frame(width: 340, height: 450).padding(.bottom,60)
        }
        
    }
}

struct CharacterCardView_Previews: PreviewProvider {
    static var previews: some View {
        // Set default character
        let character = Character.testCharacter()
        CharacterCardView(character: character)
    }
}
