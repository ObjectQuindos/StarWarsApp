//
//  LoadingViewController.swift
//  StarWarsApp
//
//  Created by David López on 29/12/18.
//  Copyright © 2018 David López. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    @IBOutlet weak var containerIndicatorView: UIView!{ didSet { containerIndicatorView.layer.cornerRadius = 10 } }
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicatorView.startAnimating()
        TypeRequests.getAllStarWarsData { (starWarsData) in
            self.indicatorView.stopAnimating()
            self.showInitialViewController(withData: starWarsData)
        }
    }
    
    private func showInitialViewController(withData starWarsData: [String : Any]?) {
        let initialViewController = self.storyboard?.instantiateViewController(withIdentifier: "initialViewController") as! InitialViewController
        initialViewController.starWarsData = starWarsData
        let navigation = UINavigationController(rootViewController: initialViewController)
        self.present(navigation, animated: true, completion: nil)
    }
}
