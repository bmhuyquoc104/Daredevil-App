//
//  ComicPreviewView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 30/07/2022.
//

import SwiftUI

struct ComicPreviewView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var comicModel: ComicsModel
    @State var page = 0
    var comic: ComicDetail
    var body: some View {
        VStack(alignment:.leading){
            Button {
                presentationMode.wrappedValue.dismiss()
                
            } label: {
                Image(systemName: "arrow.left").font(.system(size: 22)).foregroundColor(Color("Pink Raspberry")).padding(.leading,20)
            }
            TabView(selection: $page) {
                
                ForEach(comic.previews.indices,id:\.self) {
                    index in
                    VStack (spacing:10) {
                        Image(comic.previews[index]).resizable().aspectRatio(contentMode: .fill).frame(width: 350, height: 650 ).cornerRadius(10).tag(index)
                       
                    }.padding()
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            .onChange(of: page, perform: { value in
                comicModel.updatePage(id: comic.id, page: page)
            })
            .onAppear {
                page = comic.currentPage
            }
        }
    }
    
}

struct ComicPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        let testcomic = ComicDetail.testComicDetail()
        ComicPreviewView(comic: testcomic)
    }
}
