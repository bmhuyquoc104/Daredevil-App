//
//  BookStoresMapView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 29/07/2022.
//

import SwiftUI
import MapKit

struct BookStoresMapView: View {
    @EnvironmentObject var bookStore:BookStoreModel
    @State var address:String?
    @State var isToggleMap:Bool = false
    @Binding var tabSelection:Int
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 10.7673487, longitude: 106.6851966), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    

    var body: some View {
        if (!isToggleMap) {
            ZStack (alignment:.topTrailing){
                let arr: [PointOfInterest] = PointOfInterest.getCoordinate(array: bookStore.bookstores)
                NavigationView {
                    Map(coordinateRegion: $mapRegion,annotationItems: arr){
                        arr in
                        MapAnnotation(coordinate: arr.coordinate) {
                            NavigationLink{
                                BookStoreDetailView().onAppear {
                                    bookStore.getCurentBookStore(id: arr.id)
                                }
                            }label: {
                                Image("daredevilCircle").resizable().aspectRatio(contentMode: .fit).frame(width:30,height: 30)
                            }
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                }
                VStack{
                    Button {
                        isToggleMap.toggle()
                        tabSelection = 3
                    } label: {
                            Text("Switch to list view").bold().foregroundColor(Color("Pink Raspberry"))
                        
                    }.padding()
                    HStack{
                        Button{
                            mapRegion.span.latitudeDelta *= 0.9
                            mapRegion.span.longitudeDelta *= 0.9
                        }label: {
                            Image(systemName: "plus.magnifyingglass").foregroundColor(.black)
                        }
                        Button{
                            mapRegion.span.latitudeDelta /= 0.9
                            mapRegion.span.longitudeDelta /= 0.9
                        }label: {
                            Image(systemName: "minus.magnifyingglass").foregroundColor(.black)
                        }
                    }
                    
                }
                
            }
            
            
           
        }
        else{
            BookStoresListView(tabSelection: $tabSelection)
        }
        
    }
}

//struct BookStoresMapView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookStoresMapView()
//    }
//}
