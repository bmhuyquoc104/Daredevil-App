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
    
    
    static func testCharacter() -> Character{
        let character = Character(id: 1, description: "Abandoned by his mother, Matt Murdock was raised by his father, boxer \"Battling Jack\" Murdock, in Hell's Kitchen. Realizing that rules were needed to prevent people from behaving badly, young Matt decided to study law; however, when he saved a man from an oncoming truck, it spilled a radioactive cargo that rendered Matt blind while enhancing his remaining senses. Under the harsh tutelage of blind martial arts master Stick, Matt mastered his heightened senses and became a formidable fighter.", name: "Daredevil", image: "daredevil2",realName: "Matt Murdock",cardBackground: "Imperial Purple")
        return character
    }
}
