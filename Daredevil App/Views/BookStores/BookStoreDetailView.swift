//
//  BookStoreDetailView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 29/07/2022.
//

import SwiftUI

struct BookStoreDetailView: View {
    @EnvironmentObject var bookStore: BookStoreModel

    var body: some View {
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
        else{
            ProgressView()
        }
    }
}


