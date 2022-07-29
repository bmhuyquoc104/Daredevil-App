//
//  Character.swift
//  Daredevil App
//
//  Created by Võ Quốc Huy on 26/07/2022.
//

import Foundation

struct Character: Decodable,Identifiable {
    var id :Int
    var description: String
    var name: String
    var image: String
    var realName:String
    var cardBackground:String
    var attributes:Attributes
    var personalInfo: PersonalInfo
    var creatorsAppearance:CreatorsAppearance
    var movies: [Movie]
    var comics: [Comic]
    
    static func testCharacter() -> Character{
        let attributes = Attributes(intelligence: 3, strength: 3, speed: 2,durability: 2, energyProjection: 4, fightingSkills: 5)
        let personalInfo = PersonalInfo(height: "1.8m", weight: "83.91kg",gender: "Male", occupation: "Lawyer", citizenship: "American")
        let movie1 = Movie(id: 1, title: "sieu nhan1", image: "daredevil")
        let movie2 = Movie(id: 2, title: "sieu nhan2", image: "daredevil")
        let movie3 = Movie(id: 3, title: "sieu nhan3", image: "daredevil")

        let movies:[Movie] = [movie1,movie2,movie3]
        
        let comic1 = Comic(id: 1, title: "sieu nhan1", image: "daredevil")
        let comic2 = Comic(id: 2, title: "sieu nhan2", image: "daredevil")
        let comic3 = Comic(id: 3, title: "sieu nhan3", image: "daredevil")

        let comics:[Comic] = [comic1,comic2,comic3]
        
        let creatorsAppearance = CreatorsAppearance(creators: "Stan Lee,Bill Everett", debut: "1964")
        let character = Character(id: 1, description: "Abandoned by his mother, Matt Murdock was raised by his father, boxer \"Battling Jack\" Murdock, in Hell's Kitchen. Realizing that rules were needed to prevent people from behaving badly, young Matt decided to study law; however, when he saved a man from an oncoming truck, it spilled a radioactive cargo that rendered Matt blind while enhancing his remaining senses. Under the harsh tutelage of blind martial arts master Stick, Matt mastered his heightened senses and became a formidable fighter.", name: "Daredevil", image: "daredevil2",realName: "Matt Murdock",cardBackground: "Imperial Purple",attributes: attributes,personalInfo: personalInfo,creatorsAppearance: creatorsAppearance,movies: movies,comics: comics)
        return character
    }
}

struct Attributes:Decodable {
    var intelligence:Int
    var strength:Int
    var speed:Int
    var durability:Int
    var energyProjection:Int
    var fightingSkills:Int
}

struct PersonalInfo:Decodable{
    var height: String
    var weight:String
    var gender:String
    var occupation:String
    var citizenship:String
}

struct CreatorsAppearance:Decodable{
    var creators:String
    var debut : String
}

struct Movie: Decodable,Identifiable{
    var id:Int
    var title :String
    var image :String
}

struct Comic: Decodable,Identifiable{
    var id:Int
    var title:String
    var image:String
}
