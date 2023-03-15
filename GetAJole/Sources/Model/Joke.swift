//
//  Joke.swift
//  GetAJole
//
//  Created by Борис Киселев on 13.03.2023.
//

import Foundation
import Realm
import RealmSwift

@objcMembers final class Joke: Object, Decodable {
    
    dynamic var setup: String = ""
    dynamic var punchline: String = ""
    
    
    enum CodingKeys: String, CodingKey {
        case setup
        case punchline
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        setup = try container.decode(String.self, forKey: .setup)
        punchline = try container.decode(String.self, forKey: .punchline)
        
        super.init()
    }
    
    override required init() {
        super.init()
    }
}

