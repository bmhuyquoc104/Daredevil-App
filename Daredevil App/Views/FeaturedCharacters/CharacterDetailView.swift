/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Your name (e.g. Võ Quốc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 27/07/2022)
 Last modified: dd/mm/yyyy (e.g. 27/07/2022)
 */

//
//  CharacterDetailView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 27/07/2022.
//

import SwiftUI

struct CharacterDetailView: View {
    // Declare the presentation mode from the environment object passing from other view
    @Environment(\.presentationMode) var presentationMode
    // Render by passing character
    var character:Character
    
    var body: some View {
        VStack (alignment:.leading,spacing:-270){
            // Show the image and header section
            GeometryReader { geo in
                ZStack{
                    Rectangle().foregroundColor(Color(character.cardBackground)).ignoresSafeArea()
                    VStack{
                        HStack{
                            // Button to dismiss the current full cover view
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
            // Show the character info
            ScrollView (){
                // Show the character personal info section
                VStack (alignment: .leading, spacing: 40){
                    // Check if the character is a person or organization. If organization, skip the personal info and attributes section
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
                        
                        // Show the attributes section
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
                        // Show the character creators section
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
                    
                    // Show the latest movies section
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
                    
                    // Show the latest comic section
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
                                    }.frame(width: 200, height: 350)
                                }
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
