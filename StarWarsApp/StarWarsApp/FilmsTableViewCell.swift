//
//  FilmsTableViewCell.swift
//  StarWarsApp
//
//  Created by David López on 30/12/18.
//  Copyright © 2018 David López. All rights reserved.
//

import UIKit

class FilmsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var filmTitleLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(filmData: [String : Any]) {
        filmTitleLabel.text = (filmData["title"] as! String)
        let episode = filmData["episode_id"] as! Int
        episodeLabel.text = "Episode: \(String(episode))"
        directorLabel.text = "Director: \(filmData["director"] as! String)"
        producerLabel.text = "Producer: \(filmData["producer"] as! String)"
        releaseDateLabel.text = "Release Date: \(filmData["release_date"] as! String)"
    }
}
