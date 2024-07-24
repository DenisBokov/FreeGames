//
//  FiltersViewController.swift
//  FreeGames
//
//  Created by Denis Bokov on 24.07.2024.
//

import UIKit

class FiltersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let showGameVC = FiltersViewController()
        
        if let sheet = showGameVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
        
        present(showGameVC, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
