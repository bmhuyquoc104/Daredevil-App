/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Your name (e.g. Võ Quốc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 26/07/2022)
 Last modified: dd/mm/yyyy (e.g. 28/07/2022)
 */

//
//  ComicsListView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 26/07/2022.
//



import SwiftUI

struct ComicsListView: View {
    // Declare the comic from the environment object passing in the top view
    @EnvironmentObject var model: ComicsModel
    // Initilizer delegation
    
    init (){
        // custom the ui navigation bar
        // custom large navigation title
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color("Pink Raspberry")),.font : UIFont.systemFont(ofSize: 26)]
        // custom inline navigation title
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color("Pink Raspberry")),.font : UIFont.systemFont(ofSize: 20)]
        // custom navigation background
        UINavigationBar.appearance().backgroundColor = UIColor.clear
        // custom navigation bar tint color
        UINavigationBar.appearance().barTintColor = UIColor(Color("white"))
    }
    
    let columns = [
        // The number of grid Items here represent the number of columns you will
        //see. so you can specify how many  items in a row thee are .
        // 2 grid Items =  2 items in a row
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        VStack(alignment:.leading){
            NavigationView {
                VStack{
                    ScrollView{
                        LazyVGrid(columns:columns,spacing:20) {
                            ForEach(0..<model.comicDetails.count, id:\.self){
                                index in
                                NavigationLink () {
                                    ComicListDetailView(comic: model.comicDetails[index])
                                } label: {
                                    VStack(spacing:10){
                                        Image(model.comicDetails[index].image).resizable().aspectRatio(contentMode: .fill).cornerRadius(10).frame(width: 160, height: 220).padding(.bottom,10)
                                        Text(model.comicDetails[index].title).foregroundColor(Color("primary"))
                                            .frame(width:150)
                                            .multilineTextAlignment(.center)
                                        ComicsWriterPencilerView().onAppear {
                                            model.getCurrentComic(id: model.comicDetails[index].id)
                                        }
                                    }.frame(width: 200, height: 320)
                                }
                            }
                        }
                    }.padding(.top,10)
                }.navigationTitle("DAREDEVIL: COMICS")
                 .navigationBarTitleDisplayMode(.large)
            }
        }.padding()
    }
}

struct ComicsListView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsListView()
            .environmentObject(ComicsModel())
    }
}
