//
//  FilmsViewController.swift
//  StarWarsApp
//
//  Created by David López on 30/12/18.
//  Copyright © 2018 David López. All rights reserved.
//

import UIKit

class FilmsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var filmsData: [[String : Any]] = []
    let links = ["https://www.filmaffinity.com/en/film267008.html", "https://www.filmaffinity.com/en/film385996.html", "https://www.filmaffinity.com/en/film504743.html", "https://www.filmaffinity.com/en/film712041.html", "https://www.filmaffinity.com/en/film605090.html", "https://www.filmaffinity.com/en/film226172.html", "https://www.filmaffinity.com/en/film569795.html"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "FILMS"
        tableView.tableFooterView = UIView()
        filmsData = filmsData.sorted(by: { ($0["episode_id"] as! Int) < ($1["episode_id"] as! Int) })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmsCell", for: indexPath) as! FilmsTableViewCell
        cell.setData(filmData: filmsData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 190
        tableView.rowHeight = UITableView.automaticDimension
        return CGFloat(tableView.rowHeight)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let openingFilmViewController = storyboard?.instantiateViewController(withIdentifier: "openingFilmViewController") as! OpeningFilmViewController
        openingFilmViewController.openingText = filmsData[indexPath.row]["opening_crawl"] as! String
        openingFilmViewController.filmaffinityLink = links[indexPath.row]
        navigationController?.pushViewController(openingFilmViewController, animated: true)
    }
}
