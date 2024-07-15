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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "games", for: indexPath) as? GamesAllCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }

}


// MARK: UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 36, height: 200)
    }
}

