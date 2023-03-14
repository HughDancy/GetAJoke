//
//  DBMangaer.swift
//  GetAJole
//
//  Created by Борис Киселев on 14.03.2023.
//

import Realm
import RealmSwift

class DBManager {
    
    var setup = ""
    var punch = ""
    
    func save() {
        let joker = Joke()
        joker.setup =  self.setup
        joker.punchline = self.punch
        
        let realm = try! Realm()
        
        try! realm.write({
            realm.add(joker)
        })
        
        for i in realm.objects(Joke.self) {
            print(i)
        }
    }
}
