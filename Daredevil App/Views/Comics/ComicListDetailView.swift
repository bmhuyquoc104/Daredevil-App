//
//  ComicListDetailView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 28/07/2022.
//

import SwiftUI

struct ComicListDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var comic:ComicDetail
    var backButton : some View { Button(action: {
           self.presentationMode.wrappedValue.dismiss()
           }) {
               HStack {
               Image(systemName: "arrow.left") // BackButton Image
                   .aspectRatio(contentMode: .fit)
                   .foregroundColor(Color("Pink Raspberry"))
               }
           }
       }
    var body: some View {
        ScrollView{
            VStack(alignment:.leading,spacing:20){
                Image(comic.image).resizable().aspectRatio(contentMode: .fill).cornerRadius(20)
                VStack(alignment:.leading,spacing:20){
                    HStack{
                        VStack (alignment:.leading,spacing:5){
                            Text("Publised:").bold().font(.system(size: 20)).foregroundColor(Color("Pink Raspberry"))
                            Text(comic.onsaleDate).font(.system(size: 18)).foregroundColor(Color("primary"))
                        }
                        Spacer()
                        VStack (alignment:.leading,spacing:5){
                            Text("Page:").bold().font(.system(size: 20)).foregroundColor(Color("Pink Raspberry"))
                            Text(String(comic.pageCount)).font(.system(size: 18)).foregroundColor(Color("primary"))
                        }
                    }
                    
                    HStack{
                        VStack (alignment:.leading,spacing:5){
                            Text(comic.rating).bold().font(.system(size: 20)).foregroundColor(Color("Pink Raspberry"))
                            Text("Rating").font(.system(size: 18)).foregroundColor(Color("primary"))
                        }
                        Spacer()
                        VStack (alignment:.leading,spacing:5){
                            Text(comic.prices).bold().font(.system(size: 20)).foregroundColor(Color("Pink Raspberry"))
                            Text("Prices:").font(.system(size: 18)).foregroundColor(Color("primary"))
                        }
                    }
                }.padding(.horizontal,20)
              
                VStack (alignment:.leading,spacing:5){
                    Text("Summary:").bold().font(.system(size: 20)).foregroundColor(Color("Pink Raspberry"))
                    Text(comic.description).font(.caption).lineSpacing(6).foregroundColor(Color("primary"))
                }
                VStack (alignment:.leading,spacing:5){
                    Text("Creators:").bold().font(.system(size: 20)).foregroundColor(Color("Pink Raspberry"))
                        ForEach(0..<comic.creators.count,id:\.self){
                            index in
                            VStack(alignment:.leading){
                                HStack(){
                                    Text("\(comic.creators[index].role):")
                                    Text(comic.creators[index].name).bold()
                                }
                            }
                          
                        }
                    
                }
                
                VStack(alignment:.leading,spacing:20){
                    Text("Characters:").bold().font(.system(size: 20)).foregroundColor(Color("Pink Raspberry"))
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack() {
                            ForEach(0..<comic.characters.count, id:\.self) {
                                index in
                                VStack(alignment:.center){
                                    Image(comic.characters[index].image).resizable().aspectRatio(contentMode: .fill).cornerRadius(10).frame(width: 160, height: 250).clipped()
                                    Spacer()
                                    Text(comic.characters[index].name).bold().foregroundColor(Color("primary"))
                                        .frame(width:150)
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                }.frame(width: 180, height: 320)
                            }
                        }
                    }
                }
                
            }.padding()
        }.navigationBarTitleDisplayMode(.large).navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton).navigationTitle(comic.title)
    }
}

struct ComicListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let testComicDetail = ComicDetail.testComicDetail()
        ComicListDetailView(comic: testComicDetail)
            
    }
}
