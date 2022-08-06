/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Your name (e.g. Võ Quốc Huy)
  ID: Your student id (e.g. s3823236)
  Created  date: dd/mm/yyyy (e.g. 30/07/2022)
  Last modified: dd/mm/yyyy (e.g. 30/07/2022)
  Acknowledgement: Snipper code for image from Mr Tom Huynh
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
    // State variable for track the scale of the image
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero

    // function for reset the state of the image
    func resetImageState() {
      return withAnimation(.spring()) {
        imageScale = 1
        imageOffset = .zero
      }
    }
    
    var body: some View {
        ZStack(alignment:.topLeading){
            TabView(selection: $page) {
                ForEach(comic.previews.indices,id:\.self) {
                    index in
                    ZStack () {
                        Text("Page: \(page + 1)").italic().bold().offset(x:100,y:350)
                        Image(comic.previews[index]).resizable().aspectRatio(contentMode: .fit).frame(width: 350, height: 650 ).tag(index).animation(.linear(duration: 1), value: isAnimating)
                            .offset(x: imageOffset.width, y: imageOffset.height)
                            .scaleEffect(imageScale)
                        // MARK: TAP GESTURE
                            .onTapGesture(count: 2, perform: {
                                if imageScale == 1 {
                                    withAnimation(.spring()) {
                                        imageScale = 4
                                    }
                                } else {
                                    resetImageState()
                                }
                            })// MARK: DRAG GESTURE
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        withAnimation(.linear(duration: 1)) {
                                            imageOffset = value.translation
                                        }
                                    }
                                    .onEnded { _ in
                                        if imageScale <= 1 {
                                            resetImageState()
                                        }
                                    }
                            )
                        
                        // MARK: MAGNIFICATION GESTURE
                            .gesture(
                                MagnificationGesture()
                                    .onChanged { value in
                                        withAnimation(.linear(duration: 1)) {
                                            if imageScale >= 1 && imageScale <= 5 {
                                                imageScale = value
                                            } else if imageScale > 5 {
                                                imageScale = 5
                                            }
                                        }
                                    }
                                    .onEnded { _ in
                                        if imageScale > 5 {
                                            imageScale = 5
                                        } else if imageScale <= 1 {
                                            resetImageState()
                                        }
                                    }
                            )
                        
                    }.padding() .onAppear(perform: {
                        isAnimating = true
                    })
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
