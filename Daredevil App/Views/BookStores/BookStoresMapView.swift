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
//  BookStoresMapView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 29/07/2022.
//

import SwiftUI
// Import library for working with map
import MapKit

struct BookStoresMapView: View {
    // Declare the book store from the environment object passing in the top view
    @EnvironmentObject var bookStore:BookStoreModel
    // State varriable for checking the button status
    @State var isToggleMap:Bool = false
    // Binding variable for tracking the tabselection from other views
    @Binding var tabSelection:Int
    // State variable for tracking the mapRegion
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 10.7673487, longitude: 106.6851966), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var body: some View {
        // Check whether the user choose the map or list to display
        if (!isToggleMap) {
            ZStack (alignment:.topTrailing){
                // Create arr to store all coordinate from bookstores arr
                let arr: [PointOfInterest] = PointOfInterest.getCoordinate(array: bookStore.bookstores)
                // Navigation view to link to book store detail view
                NavigationView {
                    // Create a map
                    Map(coordinateRegion: $mapRegion,annotationItems: arr){
                        arr in
                        // Show all map annotations
                        MapAnnotation(coordinate: arr.coordinate) {
                            // link to the book store detail view
                            NavigationLink{
                                // find the current book store and display when the view appear
                                BookStoreDetailView().onAppear {
                                    bookStore.getCurentBookStore(id: arr.id)
                                }
                            }label: {
                                // custom map annotation
                                Image("daredevilCircle").resizable().aspectRatio(contentMode: .fit).frame(width:30,height: 30)
                            }
                        }
                    }
                    // ignore safe area
                    .edgesIgnoringSafeArea(.all)
                }
                VStack{
                    // toggle the button to switch betwwen list and map
                    Button {
                        isToggleMap.toggle()
                        tabSelection = 3
                    } label: {
                        Text("Switch to list view").bold().foregroundColor(Color("Pink Raspberry"))
                        
                    }.padding()
                }
                
            }
        }
        // Show the list view
        else{
            BookStoresListView(tabSelection: $tabSelection)
        }
    }
}

