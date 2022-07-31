/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Your name (e.g. Võ Quốc Huy)
  ID: Your student id (e.g. s3823236)
  Created  date: dd/mm/yyyy (e.g. 30/07/2022)
  Last modified: dd/mm/yyyy (e.g. 30/07/2022)
*/

//
//  ComicPreviewView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 30/07/2022.
//

import SwiftUI

struct ComicPreviewView: View {
    // Get the presentation mode from other views
    @Environment(\.presentationMode) var presentationMode
    // Declare the comic detail from the environment object passing in the top view
    @EnvironmentObject var comicModel: ComicsModel
    // State variable to track the current page
    @State var page = 0
    // Render by passing comic from other views
    var comic: ComicDetail
    
    var body: some View {
        ZStack(alignment:.topLeading){
            TabView(selection: $page) {
                ForEach(comic.previews.indices,id:\.self) {
                    index in
                    VStack () {
                        Image(comic.previews[index]).resizable().aspectRatio(contentMode: .fit).frame(width: 350, height: 600 ).tag(index)
                        Text("Page: \(page + 1)").italic().bold().offset(x:100,y:0)
                    }.padding()
                }
            }
            // custom tav view display
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            // Re render and update the current page when the tab is changed
            .onChange(of: page, perform: { value in
                comicModel.updatePage(id: comic.id, page: page)
            })
            // Set the current page when the view appears
            .onAppear {
                page = comic.currentPage
            }.padding(.top,-120)
            
            // Button to close the current full screen over view
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "arrow.left").font(.system(size: 22)).foregroundColor(Color("Pink Raspberry")).padding(.leading,20)
                Text(comic.title).foregroundColor(Color("Pink Raspberry"))
            }.padding(.top,10)
        }
    }
    
}

struct ComicPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        let testcomic = ComicDetail.testComicDetail()
        ComicPreviewView(comic: testcomic)
    }
}
