//
//  FeaturedCharacterView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 26/07/2022.
//

import SwiftUI

struct FeaturedCharacterView: View {
    var body: some View {
        ZStack{
            GeometryReader{
                geometry in
                Rectangle().ignoresSafeArea().frame(width: geometry.size.width, height: geometry.size.height)
                    .foregroundColor(Color("primary"))
            }
        }
    }
}

struct FeaturedCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCharacterView()
    }
}
