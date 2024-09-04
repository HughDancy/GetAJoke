//
//  NetworkManager.swift
//  GetAJole
//
//  Created by Борис Киселев on 20.08.2024.
//

import Alamofire

protocol MainScreenNetworkManagerProtocol: AnyObject {
    func getRandomJoke(compelition: @escaping (_ joke: Joke) -> Void)
}

final class MainScreenNetworkManager: MainScreenNetworkManagerProtocol {
    func getRandomJoke(compelition: @escaping (_ joke: Joke) -> Void)  {
        let request = AF.request("https://official-joke-api.appspot.com/jokes/random")
        request.responseDecodable(of: Joke.self) { data in
            guard let randomJoke = data.value else {
                compelition(Joke())
                return }
            compelition(randomJoke)
        }
    }
}


