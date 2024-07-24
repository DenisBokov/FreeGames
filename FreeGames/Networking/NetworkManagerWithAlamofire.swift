//
//  NetworkManagerWithAlamofire.swift
//  FreeGames
//
//  Created by Denis Bokov on 23.07.2024.
//

import Foundation
import Alamofire


class NetworkManagerWithAlamofire {
    static var shared = NetworkManagerWithAlamofire()
    
    private init() {}
    
    func fetchGames(from url: String, completion: @escaping(Result<[FreeGames], AFError>) -> Void) {
        AF.request(url)
            .responseJSON { dataResponse in
                guard let statusCode = dataResponse.response?.statusCode else { return }
                if (200...299).contains(statusCode) {
                    guard let value = dataResponse.value else { return }
                    let games = FreeGames.getAllGames(from: value)
                    completion(.success(games))
                } else {
                    guard let error = dataResponse.error else { return }
                    completion(.failure(error))
                }
            }
    }
}
