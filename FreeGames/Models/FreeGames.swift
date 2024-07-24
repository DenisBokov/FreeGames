//
//  FreeGames.swift
//  FreeGames
//
//  Created by Denis Bokov on 15.07.2024.
//

import Foundation

struct FreeGames: Decodable {
    let id: Int
    let title: String
    let thumbnail: String
    let short_description: String
    let game_url: String
    let genre: String
    let platform: String
    let publisher: String
    let developer: String
    let release_date: String
    let freetogame_profile_url: String
    
    init(id: Int, title: String, thumbnail: String, short_description: String, game_url: String, genre: String, platform: String, publisher: String, developer: String, release_date: String, freetogame_profile_url: String) {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
        self.short_description = short_description
        self.game_url = game_url
        self.genre = genre
        self.platform = platform
        self.publisher = publisher
        self.developer = developer
        self.release_date = release_date
        self.freetogame_profile_url = freetogame_profile_url
    }
    
    init(gameData: [String:Any]) {
        id = gameData["id"] as? Int ?? 0
        title = gameData["title"] as? String ?? ""
        thumbnail = gameData["thumbnail"] as? String ?? ""
        short_description = gameData["short_description"] as? String ?? ""
        game_url = gameData["game_url"] as? String ?? ""
        genre = gameData["genre"] as? String ?? ""
        platform = gameData["platform"] as? String ?? ""
        publisher = gameData["publisher"] as? String ?? ""
        developer = gameData["developer"] as? String ?? ""
        release_date = gameData["release_date"] as? String ?? ""
        freetogame_profile_url = gameData["freetogame_profile_url"] as? String ?? ""
    }
    
    static func getAllGames(from value: Any) -> [FreeGames] {
        guard let gamesData = value as? [[String: Any]] else { return [] }
        var games: [FreeGames] = []
        gamesData.forEach { gameData in
            let game = FreeGames(gameData: gameData)
            games.append(game)
        }
        return games
    }
}

/*
 "id": 582,
 "title": "Tarisland",
 "thumbnail": "https://www.freetogame.com/g/582/thumbnail.jpg",
 "short_description": "A cross-platform MMORPG developed by Level Infinite and Published by Tencent.",
 "game_url": "https://www.freetogame.com/open/tarisland",
 "genre": "MMORPG",
 "platform": "PC (Windows)",
 "publisher": "Tencent",
 "developer": "Level Infinite",
 "release_date": "2024-06-22",
 "freetogame_profile_url": "https://www.freetogame.com/tarisland"
 */
