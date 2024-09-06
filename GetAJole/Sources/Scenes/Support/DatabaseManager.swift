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

protocol FavoritesDatabaseProtocol: AnyObject {
    func getSavedJokes() ->  Results<Joke>
    func deleteJoke(_ joke: Joke)
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

final class FavoritesDataBaseManager: FavoritesDatabaseProtocol {
    func getSavedJokes() ->  Results<Joke> {
        let realm = try! Realm()
        return realm.objects(Joke.self)
    }

    func deleteJoke(_ joke: Joke) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(joke)
        }
    }
}
