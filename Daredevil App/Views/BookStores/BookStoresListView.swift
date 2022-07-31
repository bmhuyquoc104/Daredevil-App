/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Your name (e.g. Võ Quốc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 26/07/2022)
 Last modified: dd/mm/yyyy (e.g. 29/07/2022)
 */

//
//  ComicStoresListView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 26/07/2022.
//

import SwiftUI

struct BookStoresListView: View {
    // Declare the book store from the environment object passing in the top view
    @EnvironmentObject var bookstore: BookStoreModel
    // State varriable for checking the button status
    @State var isPresented = false
    @State var isToggleMap:Bool = false
    // Binding variable for tracking the tabselection from other views
    @Binding var tabSelection: Int
    // State variable  to track the user input
    @State private var searchText = ""
    
    var body: some View {
        // Check whether the user choose the map or list to display
        if !isToggleMap{
            // navigation view to the book store detail
            NavigationView {
                VStack {
                    // toggle the button to switch betwwen list and map
                    Button {
                        isToggleMap.toggle()
                        // assign the tab selection to 3 to force the display still in the third tab instead automatically go back to first tab
                        tabSelection = 3
                    } label: {
                        HStack{
                            Spacer()
                            Text("Switch to map view").bold().foregroundColor(Color("Pink Raspberry"))
                        }.padding(.trailing)
                    }
                    // scroll view to show all the bookstores
                    ScrollView{
                        ForEach(searchResults){
                            item in
                            // link to the book store detail
                            NavigationLink {
                                // find the current book store and display when the view appear
                                BookStoreDetailView().onAppear {
                                    bookstore.getCurentBookStore(id: item.id)
                                }
                                
                            } label: {
                                // Card to show book store
                                BookStoreListRowView(image: item.image, title: item.title, hours: item.hours, address: item.address)
                                
                            }
                        }
                        // add the search bar and set the mode to always display the search bar
                    }.navigationTitle("BOOKSTORES").accentColor(.black).searchable(text: $searchText,placement:.navigationBarDrawer(displayMode: .always),prompt: "Search by name or address")
                }
            }.padding()
        }
        // show the map view if user toggle button
        else{
            BookStoresMapView(tabSelection: $tabSelection)
        }
    }
    
    // function to return the bookstores array by the user input
    var searchResults: [BookStore] {
        // if the search bar is empty -> show all
        if searchText.isEmpty {
            return bookstore.bookstores
        } else {
            // search items that contain either title or address (Case insensitive) from user input
            return bookstore.bookstores.filter { $0.title.localizedCaseInsensitiveContains(searchText) || $0.address.localizedCaseInsensitiveContains(searchText)}
        }
    }
}


