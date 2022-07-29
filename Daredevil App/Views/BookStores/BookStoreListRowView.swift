//
//  BookStoreListRowView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 29/07/2022.
//

import SwiftUI

struct BookStoreListRowView: View {
    var image: String
    var title: String
    var hours: String
    var address: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .aspectRatio(CGSize(width: 335, height: 150), contentMode: .fit)
                .cornerRadius(8)
                .shadow(radius: 3)
            HStack {
                Image(image).resizable().clipShape(Circle()).frame(width: 116, height: 116)
                VStack(alignment:.leading,spacing: 10){
                    Text(title).bold().font(.headline).multilineTextAlignment(.leading)
                    HStack(alignment:.center){
                        Image(systemName: "clock").resizable().frame(width: 15, height: 15).foregroundColor(Color("Pink Raspberry"))
                        Text(hours).font(Font.system(size: 10))
                    }
                    HStack(alignment:.center){
                        Image(systemName: "mappin.and.ellipse").resizable().frame(width: 15, height: 15).foregroundColor(Color("Pink Raspberry"))
                        Text(address).font(Font.system(size: 10)).multilineTextAlignment(.leading)
                    }
                }.padding(.leading,30)
            }.padding(.horizontal,10)
        }.padding(.bottom)
    }
}


