//
//  ComicStoresListView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 26/07/2022.
//

import SwiftUI

struct BookStoresListView: View {

    @EnvironmentObject var bookstore: BookStoreModel
    @State var isPresented = false
    @State var isToggleMap:Bool = false
    @Binding var tabSelection: Int
    @State private var searchText = ""
    var body: some View {
        if !isToggleMap{
            NavigationView {
                VStack {
                    Button {
                        isToggleMap.toggle()
                        tabSelection = 3
                    } label: {
                        HStack{
                            Spacer()
                            Text("Switch to map view").bold().foregroundColor(Color("Pink Raspberry"))
                        }.padding(.trailing)
                    }

                    ScrollView{
                        ForEach(searchResults){
                            item in
                            NavigationLink {
                                BookStoreDetailView().onAppear {
                                    bookstore.getCurentBookStore(id: item.id)
                                }
                                
                            } label: {
                                BookStoreListRowView(image: item.image, title: item.title, hours: item.hours, address: item.address)

                            }

                        }
                    }.navigationTitle("BOOKSTORES").accentColor(.black).searchable(text: $searchText,placement:.navigationBarDrawer(displayMode: .always),prompt: "Search by name or address")
                }
            }.padding()
        }
        else{
            BookStoresMapView(tabSelection: $tabSelection)
        }
    
        
    }
    var searchResults: [BookStore] {
            if searchText.isEmpty {
                return bookstore.bookstores
            } else {
                return bookstore.bookstores.filter { $0.title.localizedCaseInsensitiveContains(searchText) || $0.address.localizedCaseInsensitiveContains(searchText)}
            }
        }
    
}


