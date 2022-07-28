//
//  ComicsWriterPencilerView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 28/07/2022.
//

import SwiftUI

struct ComicsWriterPencilerView: View {
    @EnvironmentObject var comicModel:ComicsModel
   
    
    @State var result:String?
    var body: some View {
        if comicModel.currentComic != nil {
            ForEach(0..<comicModel.currentComic!.creators.count,id:\.self){
                index in
                let creator = comicModel.currentComic!.creators[index]
                    if creator.role == "writer"{
                        Text(creator.name).font(.caption).foregroundColor(Color("Pink Raspberry"))
                    }
            }
        }
        
        else{
            ProgressView()
        }
        
    }
}


