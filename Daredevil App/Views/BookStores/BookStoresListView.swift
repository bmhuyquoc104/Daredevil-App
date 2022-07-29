//
//  ComicStoresListView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 26/07/2022.
//

import SwiftUI

struct BookStoresListView: View {
    @EnvironmentObject var bookstore: BookStoreModel
    var body: some View {
        NavigationView {
            ScrollView{
                ForEach(0..<bookstore.bookstores.count, id:\.self){
                    index in
                    NavigationLink {
                        BookStoreDetailView()
                    } label: {
                        BookStoreListRowView(image: bookstore.bookstores[index].image, title: bookstore.bookstores[index].title, hours: bookstore.bookstores[index].hours, address: bookstore.bookstores[index].address)

                    }

                }
            }.navigationTitle("BOOKSTORES").accentColor(.black)
        }.padding()
        
    }
    
    
}

struct BookStoresListView_Previews: PreviewProvider {
    static var previews: some View {
        BookStoresListView()
    }
}
