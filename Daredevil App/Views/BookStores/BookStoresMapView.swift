//
//  BookStoresMapView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 29/07/2022.
//

import SwiftUI

struct BookStoresMapView: View {
    @State var isToggleMap:Bool = false
    @Binding var tabSelection:Int

    var body: some View {
        if (!isToggleMap) {
            Button {
                isToggleMap.toggle()
                tabSelection = 3
            } label: {
                VStack(alignment:.trailing){
                    Text("Switch to map view").bold().foregroundColor(Color("Pink Raspberry"))
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
