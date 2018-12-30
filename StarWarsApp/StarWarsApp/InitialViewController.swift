//
//  ViewController.swift
//  StarWarsApp
//
//  Created by David López on 28/12/18.
//  Copyright © 2018 David López. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var upperSegmentedControl: UISegmentedControl!
    @IBOutlet weak var lowerSegmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var starWarsData: [String: Any]?
    var dataSelected: [[String : Any]] = []
    var typeSelected: TypeSelected = .planets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSelected = starWarsData!["planets"] as! [[String : Any]]
        title = "STAR WARS"
        lowerSegmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment
        setUI()
    }
    
    private func setUI() {
        let imageView = UIImageView(image: UIImage(named: "initBack"))
        tableView.backgroundView = imageView
        tableView.backgroundColor = UIColor.lightGray
        tableView.tableFooterView = UIView()
        
        let barButtonItem = UIBarButtonItem(title: "Films", style: .plain, target: self, action: #selector(InitialViewController.filmsViewController))
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSelected.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starWarsCell", for: indexPath)
        let name = dataSelected[indexPath.row]["name"] as! String
        cell.textLabel?.text = name
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showDetailController(withData: dataSelected[indexPath.row])
    }
    
    private func showDetailController(withData data: [String : Any]) {
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
        detailViewController.modalPresentationStyle = .custom
        detailViewController.dataSelected = data
        detailViewController.typeSelected = self.typeSelected
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.fade
        self.view.window?.layer.add(transition, forKey: kCATransition)
        present(detailViewController, animated: false, completion: nil)
    }
    
    @objc private func filmsViewController() {
        let filmsViewController = storyboard?.instantiateViewController(withIdentifier: "filmsViewController") as! FilmsViewController
        filmsViewController.filmsData = starWarsData!["films"] as! [[String : Any]]
        self.navigationController?.pushViewController(filmsViewController, animated: true)
    }
    
    @IBAction func upperSegmentedControlAction(_ sender: UISegmentedControl) {
        lowerSegmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment
        
        if sender.selectedSegmentIndex == 0 {
            self.dataSelected = starWarsData!["planets"] as! [[String : Any]]
            self.typeSelected = .planets
        }
        if sender.selectedSegmentIndex == 1 {
            self.dataSelected = starWarsData!["people"] as! [[String : Any]]
            self.typeSelected = .people
        }
        if sender.selectedSegmentIndex == 2 {
            self.dataSelected = starWarsData!["species"] as! [[String : Any]]
            self.typeSelected = .species
        }
        tableView.reloadData()
    }
    
    @IBAction func lowerSegmentedControlAction(_ sender: UISegmentedControl) {
        upperSegmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment
        
        if sender.selectedSegmentIndex == 0 {
            self.dataSelected = starWarsData!["spaceships"] as! [[String : Any]]
            self.typeSelected = .spaceships
        }
        if sender.selectedSegmentIndex == 1 {
            self.dataSelected = starWarsData!["vehicles"] as! [[String : Any]]
            self.typeSelected = .vehicles
        }
        tableView.reloadData()
    }
}
