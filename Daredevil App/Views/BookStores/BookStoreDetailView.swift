/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Your name (e.g. Võ Quốc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 29/07/2022)
 Last modified: dd/mm/yyyy (e.g. 29/07/2022)
 */

//
//  BookStoreDetailView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 29/07/2022.
//

import SwiftUI

struct BookStoreDetailView: View {
    // Declare the book store from the environment object passing in the top view
    @EnvironmentObject var bookStore: BookStoreModel
    
    var body: some View {
        // Check whether the current bookstore has been found or not
        if bookStore.currentBookStore != nil {
            VStack (spacing:0){
                VStack {
                    Image(bookStore.currentBookStore?.image ?? "").resizable().clipShape(Circle()).frame(width: 180, height: 180)
                    Text(bookStore.currentBookStore?.title ?? "").font(.largeTitle).frame(width:250).multilineTextAlignment(.center).foregroundColor(Color("Pink Raspberry"))
                    
                    ScrollView {
                        VStack (spacing:20){
                            VStack (alignment:.leading, spacing:10){
                                HStack(){
                                    HStack(spacing:2){
                                        Image(systemName: "clock").foregroundColor(Color("Pink Raspberry"))
                                        Text(bookStore.currentBookStore?.hours ?? "").font(.system(size: 16))
                                    }
                                    Spacer()
                                    HStack(alignment:.center,spacing:2){
                                        Image(systemName: "star").foregroundColor(Color("Pink Raspberry"))
                                        Text(bookStore.currentBookStore?.rating ?? "").font(.system(size: 16))
                                    }
                                }
                                HStack(spacing:2){
                                    Image(systemName: "phone").foregroundColor(Color("Pink Raspberry"))
                                    Text(bookStore.currentBookStore?.phone ?? "").font(.system(size: 16))
                                }
                                HStack(spacing:2){
                                    Image(systemName: "location").foregroundColor(Color("Pink Raspberry"))
                                    Text(bookStore.currentBookStore?.address ?? "").font(.system(size: 16))
                                }
                                
                            }.frame(width:340).padding()
                            VStack(alignment:.leading,spacing:20){
                                Text("Available Comics:").bold().font(.system(size: 20)).foregroundColor(Color("Pink Raspberry"))
                                ScrollView(.horizontal,showsIndicators: false){
                                    HStack() {
                                        ForEach(0..<bookStore.currentBookStore!.comics.count, id:\.self) {
                                            index in
                                            VStack(alignment:.center){
                                                Image(bookStore.currentBookStore?.comics[index].image ?? "").resizable().aspectRatio(contentMode: .fill).cornerRadius(10).frame(width: 160, height: 250).clipped()
                                                Spacer()
                                                Text(bookStore.currentBookStore?.comics[index].title ?? "").bold().foregroundColor(Color("primary"))
                                                    .frame(width:150)
                                                    .multilineTextAlignment(.center)
                                                Spacer()
                                            }.frame(width: 180, height: 320)
                                        }
                                    }
                                }
                            }.padding()
                            
                        }
                    }.padding(.bottom)
                }
            }
        }
        // Show the progress when finding the bookstore
        else{
            ProgressView()
        }
    }
}


