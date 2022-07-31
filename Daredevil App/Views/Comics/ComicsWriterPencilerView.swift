/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Your name (e.g. Võ Quốc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 28/07/2022)
 Last modified: dd/mm/yyyy (e.g. 28/07/2022)
 */

//
//  ComicsWriterPencilerView.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 28/07/2022.
//

import SwiftUI

struct ComicsWriterPencilerView: View {
    // Declare the comic from the environment object passing in the top view
    @EnvironmentObject var comicModel:ComicsModel
    
    var body: some View {
        // Check if the comic has been founded or not
        if comicModel.currentComic != nil {
            ForEach(0..<comicModel.currentComic!.creators.count,id:\.self){
                index in
                let creator = comicModel.currentComic!.creators[index]
                if creator.role == "Writer"{
                    Text(creator.name).font(.caption).foregroundColor(Color("Pink Raspberry"))
                }
            }
        }
        // If not display progress view
        else{
            ProgressView()
        }
    }
}


