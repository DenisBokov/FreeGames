//
//  MainViewController.swift
//  FreeGames
//
//  Created by Denis Bokov on 15.07.2024.
//

import UIKit

class MainViewController: UICollectionViewController {
    
    @IBOutlet var activityIndicatorForMainVC: UIActivityIndicatorView!
    
    private var games: [FreeGames] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicatorForMainVC.startAnimating()
        activityIndicatorForMainVC.hidesWhenStopped = true
        
        fectAllGames()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        games.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "games", for: indexPath) as? GamesAllCollectionViewCell else { return UICollectionViewCell() }
        
        let game = games[indexPath.item]
        cell.setupCollectionView()
        cell.configure(with: game)
        activityIndicatorForMainVC.stopAnimating()
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "game" {
            guard let indexPaths = collectionView.indexPathsForSelectedItems else { return }
            indexPaths.forEach { indexPath in
                guard let showGameVC = segue.destination as? ShowGameViewController else { return }
                showGameVC.game = games[indexPath.item]
            }
        }
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 36, height: 200)
    }
}

// MARK: Networking
extension MainViewController {
    private func fectAllGames() {
        /// С помощью URLSession
//        NetworkManager.shared.fetch([FreeGames].self, from: Link.allGamesURL.rawValue) { [weak self] result in
//            switch result {
//            case .success(let games):
//                self?.games = games
//                self?.collectionView.reloadData()
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        /// С помощью Alamofire
        NetworkManagerWithAlamofire.shared.fetchGames(from: Link.allGamesURL.rawValue) { [weak self] result in
            switch result {
            case .success(let games):
                self?.games = games
                self?.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

