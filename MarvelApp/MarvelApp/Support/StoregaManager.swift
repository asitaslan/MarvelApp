//
//  StoregaManager.swift
//  MarvelApp
//
//  Created by Asit Aslan on 2.02.2022.
//  Copyright © 2022 Asit Aslan. All rights reserved.
//

import Foundation

class Favorite{
    internal init(status: Bool = false, charactersResult: CharactersResult) {
        self.status = status
        self.charactersResult = charactersResult
    }
    
    var status = false
    var charactersResult: CharactersResult
}


class StorageManager {
    
    class func addFav(isFav: Bool, charactersResult: CharactersResult) {
        for (index, item) in Constants.favorites.enumerated() {
            if item.charactersResult.id == charactersResult.id {
                Constants.favorites[index].status = isFav
            }
        }
        Constants.favorites.append(Favorite(status: isFav, charactersResult: charactersResult))
    }
    
    class func getFav(charactersResult: CharactersResult) -> Bool?{
        for (_, item) in Constants.favorites.enumerated() {
            if item.charactersResult.id == charactersResult.id {
                print("Success: \(item.status) charac: \(charactersResult.name)")
                return item.status
            }
        }
        return nil
    }
    
}
