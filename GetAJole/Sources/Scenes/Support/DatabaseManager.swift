//
//  DatabaseManager.swift
//  GetAJole
//
//  Created by Борис Киселев on 20.08.2024.
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
