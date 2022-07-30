//
//  Comics.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 28/07/2022.
//

import Foundation

struct ComicDetail:Identifiable,Decodable{
    var id:Int
    var title:String
    var description:String
    var pageCount:Int
    var onsaleDate: String
    var prices: String
    var image:String
    var rating:String
    var creators: [Creator]
    var characters: [ComicCharacter]
    var currentPage:Int
    var previews:[String]
    
    static func testComicDetail() -> ComicDetail {
        
        let creator1 = Creator(name: "Marco Checchetto", role: "inker (cover)",id:1)
        let creator2 = Creator(name: "Vc Clayton Cowles", role: "letterer",id:2)
        let creator3 = Creator(name: "Edward Devin Lewis", role: "editor",id:3)
        let creators = [creator1,creator2,creator3]
        
        let character1 = ComicCharacter(name: "Daredevil", id: 1,image:"ch-cap")
        let character2 = ComicCharacter(name: "Elektra", id: 2,image:"ch-cap")
        let character3 = ComicCharacter(name: "Fantastic Four", id: 3,image:"ch-cap")
        let characters = [character1,character2,character3]
        
        let comicDetail = ComicDetail(id: 0, title: "Devil's Reign (2021) #6", description: "Wilson Fisk’s hubris as mayor of New York has cast the city in the waiting arms of a cadre of dangerous and deadly super villains! Worse still, Fisk’s vendetta against the heroes who have stood against him for so long has left the city defenseless. You may think you’ve heard a tale like this before, but there will be no last minute bargains struck between Fisk and the heroes, no truce to stop the fighting and no mutual parting of the ways. Just blood, sweat and tears! Trust us, True Believer, you have NO IDEA what’s coming — or the effect it will have on the Marvel Universe!", pageCount: 40, onsaleDate: "2022-04-06", prices: "$5.99", image: "cm-dr#5", rating: "Rated +", creators: creators, characters: characters,currentPage: 0,previews: ["cm-#dr1-1","cm-#dr2-2"])
        return comicDetail
    }
}

struct Creator: Decodable,Identifiable{
    var name:String
    var role:String
    var id:Int
}

struct ComicCharacter: Decodable, Identifiable{
    var name:String
    var id:Int
    var image:String
}
