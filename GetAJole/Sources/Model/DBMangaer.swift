//
//  DBMangaer.swift
//  GetAJole
//
//  Created by Борис Киселев on 14.03.2023.
//

import Realm
import RealmSwift

protocol DataBaseSavingProtocol: AnyObject {
    func saveJoke(setup: String, punch: String)
}

final class MainScreenDataBaseManager: DataBaseSavingProtocol {
    func saveJoke(setup: String, punch: String) {
        let joke = Joke()
        joke.setup =  setup
        joke.punchline = punch

        let realm = try! Realm()

        try! realm.write({
            realm.add(joke)
        })

        for i in realm.objects(Joke.self) {
            print(i)
            print(type(of: realm.objects(Joke.self)))
        }
    }
}

final class DBManager {
    
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
            print(type(of: realm.objects(Joke.self)))
        }
    }
}
