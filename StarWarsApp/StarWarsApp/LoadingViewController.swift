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
            self.showInitialViewController()
        }
    }
    
    private func showInitialViewController() {
        let initialViewController = self.storyboard?.instantiateViewController(withIdentifier: "initialViewController") as! InitialViewController
        self.present(initialViewController, animated: true, completion: nil)
    }
}
