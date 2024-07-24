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
        NetworkManager.shared.fetchImage(from: game.thumbnail) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.gameImageView.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
