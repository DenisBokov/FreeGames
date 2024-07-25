//
//  ShowGameViewController.swift
//  FreeGames
//
//  Created by Denis Bokov on 17.07.2024.
//

import UIKit

class ShowGameViewController: UIViewController {

    @IBOutlet var gameImageView: UIImageView!
    @IBOutlet var titelGameLabel: UILabel!
    
    var game: FreeGames!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titelGameLabel.text = game.title
        
        fetchImageGame()
    }
}

extension ShowGameViewController {
    func fetchImageGame() {
        guard let url = URL(string: game.thumbnail) else { return }
        NetworkManager.shared.fetchImage(from: url) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.gameImageView.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
