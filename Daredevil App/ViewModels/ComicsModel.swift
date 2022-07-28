//
//  ComicsModel.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 28/07/2022.
//

import Foundation

class ComicsModel: ObservableObject{
    @Published var comicDetails:[ComicDetail] = [ComicDetail]()
    @Published var currentComic:ComicDetail?
    
    init(){
        getComicDetails()
    }
    
    // Function to get the comic detail data from local
    func getComicDetails () {
        // Create path
        let pathString = Bundle.main.path(forResource: "Comics", ofType: "json")
        
        // Check optional
        if let path = pathString {
            // Create url
            let url = URL(fileURLWithPath: path)
            // Use do catch to handle optional value data
            do {
                // Create data
                let data = try Data(contentsOf: url)
                // Create decoder
                let decoder = JSONDecoder()
                do {
                    // Create arr to store decoded value from data
                    let comicDetailArr = try decoder.decode([ComicDetail].self, from: data)
                  
                // Load the data to the published variable
                    comicDetails = comicDetailArr
                } catch  {
                    print("Can not decode data")
                }
            } catch  {
                print("Can not load data from url")
            }
        
        }
    }
    
    // Function to get current comic by id
    func getCurrentComic(id:Int){
        for comic in comicDetails {
            if (comic.id == id){
                currentComic = comic
                break
            }
        }
    }
    
}
