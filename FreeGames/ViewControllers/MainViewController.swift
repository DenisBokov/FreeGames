//
//  MainViewController.swift
//  FreeGames
//
//  Created by Denis Bokov on 15.07.2024.
//

import UIKit

enum Link: String {
    case mainURL = "https://www.freetogame.com/api/"
    case allGamesURL = "https://www.freetogame.com/api/games"
}

class MainViewController: UICollectionViewController {
    
    private var games: [FreeGames] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fectAllGames()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        games.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "games", for: indexPath) as? GamesAllCollectionViewCell else { return UICollectionViewCell() }
        
        let game = games[indexPath.item]
        cell.configure(with: game)
        
        return cell
    }

}


// MARK: UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 36, height: 200)
    }
}

extension MainViewController {
    private func fectAllGames() {
        guard let url = URL(string: Link.allGamesURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                self?.games = try JSONDecoder().decode([FreeGames].self, from: data)
                print(self?.games ?? "OOOPS!!!")
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}

