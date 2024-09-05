//
//  AssemblyIBuilder.swift
//  GetAJole
//
//  Created by Борис Киселев on 05.09.2024.
//

import UIKit

final class AssemblyIBuilder {
    func createMainModule() -> UIViewController {
        let controller = MainViewController()
        controller.dataBaseManager = MainScreenDataBaseManager()
        controller.networkManager = MainScreenNetworkManager()
        return controller
    }

    func createFavoriteModuler() -> UIViewController {
        let controller = FavoritesViewController()
        controller.databaseManager = FavoritesDataBaseManager()
        return controller
    }
}
