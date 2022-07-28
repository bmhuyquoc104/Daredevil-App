//
//  CharacterDetailView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 27/07/2022.
//

import SwiftUI

struct CharacterDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    var character:Character
    var body: some View {
        
        VStack (alignment:.leading,spacing:-270){
            GeometryReader { geo in
                ZStack{
                    Rectangle().foregroundColor(Color(character.cardBackground)).ignoresSafeArea()
                    VStack{
                        HStack{
                            Button {
                                presentationMode.wrappedValue.dismiss()
                                
                            } label: {
                                Image(systemName: "arrow.left").font(.system(size: 22)).foregroundColor(.white).padding(.leading,20)
                                
                            }
                            Spacer()
                            Text(character.name).bold().font(.system(size: 22)).foregroundColor(.white).padding(.trailing,50)
                            Spacer()
                            
                        }
                        Image(character.image
                        ).resizable().aspectRatio(contentMode: .fit)
                    }
                    
                }.frame(width: geo.size.width, height: 250)
            }
            
            ScrollView (){
                VStack (alignment: .leading, spacing: 40){
                    if (character.name != "The Hand"){
                        VStack(alignment: .leading,spacing:10){
                            Text("Personal Information").bold().font(.system(size: 20)).foregroundColor(Color(character.cardBackground))
                            HStack{
                                Text("Gender:")
                                Text(character.personalInfo.gender).bold()
                            }
                            HStack{
                                Text("Height:")
                                Text(character.personalInfo.height).bold()
                            }
                            HStack{
                                Text("Weight:")
                                Text(character.personalInfo.weight).bold()
                            }
                            HStack{
                                Text("Occupation:")
                                Text(character.personalInfo.occupation).bold()
                            }
                            HStack{
                                Text("Citizenship:")
                                Text(character.personalInfo.citizenship).bold()
                            }
                        }
                        VStack(alignment: .leading,spacing:10){
                            Text("Creators & Appearance").bold().padding(.bottom,5).font(.system(size: 20)).foregroundColor(Color(character.cardBackground))
                            HStack{
                                Text("Creator:")
                                Text(character.creatorsAppearance.creators).bold()
                            }
                            HStack{
                                Text("Debut:")
                                Text(character.creatorsAppearance.debut).bold()
                            }
                            
                        }
                        VStack (alignment: .leading,spacing:10){
                            Text("Attributes").bold().font(.system(size: 20)).foregroundColor(Color(character.cardBackground))
                            HStack(){
                                Text("Intelligence:")
                                Spacer()
                                ZStack (alignment:.leading) {
                                    Rectangle().frame(width: 200 , height: 20)
                                        .opacity(0.3)
                                        .foregroundColor(Color(character.cardBackground))
                                    Rectangle().frame(width: 200/7*(CGFloat(character.attributes.intelligence)) , height: 20)
                                        .foregroundColor(Color(character.cardBackground))
                                }
                            }
                            HStack(){
                                Text("Strength:")
                                Spacer()
                                
                                ZStack (alignment:.leading) {
                                    Rectangle().frame(width: 200 , height: 20)
                                        .opacity(0.3)
                                        .foregroundColor(Color(character.cardBackground))
                                    Rectangle().frame(width: 200/7*(CGFloat(character.attributes.strength)) , height: 20)
                                        .foregroundColor(Color(character.cardBackground))
                                    
                                }
                            }
                            HStack(){
                                Text("Speed:")
                                Spacer()
                                
                                ZStack (alignment:.leading) {
                                    Rectangle().frame(width: 200 , height: 20)
                                        .opacity(0.3)
                                        .foregroundColor(Color(character.cardBackground))
                                    Rectangle().frame(width: 200/7*(CGFloat(character.attributes.speed)) , height: 20)
                                        .foregroundColor(Color(character.cardBackground))
                                    
                                }
                            }
                            HStack(){
                                Text("Durability:")
                                Spacer()
                                ZStack (alignment:.leading) {
                                    Rectangle().frame(width: 200 , height: 20)
                                        .opacity(0.3)
                                        .foregroundColor(Color(character.cardBackground))
                                    Rectangle().frame(width: 200/7*(CGFloat(character.attributes.durability)) , height: 20)
                                        .foregroundColor(Color(character.cardBackground))
                                    
                                }
                            }
                            HStack(){
                                Text("Energy Protection:")
                                Spacer()
                                ZStack (alignment:.leading) {
                                    Rectangle().frame(width: 200 , height: 20)
                                        .opacity(0.3)
                                        .foregroundColor(Color(character.cardBackground))
                                    Rectangle().frame(width: 200/7*(CGFloat(character.attributes.energyProjection)) , height: 20)
                                        .foregroundColor(Color(character.cardBackground))
                                    
                                }
                            }
                            HStack(){
                                Text("Fighting Skills:")
                                Spacer()
                                ZStack (alignment:.leading) {
                                    Rectangle().frame(width: 200 , height: 20)
                                        .opacity(0.3)
                                        .foregroundColor(Color(character.cardBackground))
                                    Rectangle().frame(width: 200/7*(CGFloat(character.attributes.fightingSkills)) , height: 20)
                                        .foregroundColor(Color(character.cardBackground))
                                    
                                }
                            }
                            
                            
                            
                        }
                    }
                    
                    else{
                        VStack(alignment: .leading,spacing:10){
                            Text("Creators & Appearance").bold().padding(.bottom,5).font(.system(size: 20)).foregroundColor(Color(character.cardBackground))
                            HStack{
                                Text("Creator:")
                                Text(character.creatorsAppearance.creators).bold()
                            }
                            HStack{
                                Text("Debut:")
                                Text(character.creatorsAppearance.debut).bold()
                            }
                            
                        }
                        
                    }
                    
                    VStack(alignment:.leading,spacing:20){
                        Text("Latest Movie:").bold().font(.system(size: 20)).foregroundColor(Color(character.cardBackground))
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack(spacing:20) {
                                ForEach(0..<character.movies.count, id:\.self) {
                                    index in
                                    VStack(alignment:.center){
                                        Image(character.movies[index].image).resizable().aspectRatio(contentMode: .fill).cornerRadius(10).frame(width: 160, height: 220)
                                        Spacer()
                                        Text(character.movies[index].title).bold().foregroundColor(Color("primary")).frame(width:150)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }.frame(width: 200, height: 300)
                                }
                            }
                        }
                    }
                    
                    VStack(alignment:.leading,spacing:20){
                        Text("Latest Comics:").bold().font(.system(size: 20)).foregroundColor(Color(character.cardBackground))
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack() {
                                ForEach(0..<character.comics.count, id:\.self) {
                                    index in
                                    VStack(alignment:.center){
                                        Image(character.comics[index].image).resizable().aspectRatio(contentMode: .fill).cornerRadius(10).frame(width: 160, height: 220)
                                        Spacer()
                                        Text(character.comics[index].title).bold().foregroundColor(Color("primary"))
                                            .frame(width:150)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }.frame(width: 200, height: 350)                                    }
                            }
                        }
                    }
                }.padding()
                
            }.padding()
            
            
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let character = Character.testCharacter()
        CharacterDetailView(character: character)
    }
}
