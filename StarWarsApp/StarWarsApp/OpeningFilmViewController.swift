//
//  OpeningFilmViewController.swift
//  StarWarsApp
//
//  Created by David López on 30/12/18.
//  Copyright © 2018 David López. All rights reserved.
//

import UIKit

class OpeningFilmViewController: UIViewController {
    
    @IBOutlet weak var openingTextLabel: UILabel!
    var openingText = ""
    var filmaffinityLink = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "OPENING"
        openingTextLabel?.text = openingText
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "webViewSegue" {
            if let destination = segue.destination as? FilmsWebViewController {
                destination.urlString = filmaffinityLink
            }
        }
    }
}
