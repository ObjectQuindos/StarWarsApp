//
//  DetailViewController.swift
//  StarWarsApp
//
//  Created by David López on 29/12/18.
//  Copyright © 2018 David López. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var closeImageView: UIImageView!
    @IBOutlet weak var containerView: UIView! { didSet { containerView.layer.cornerRadius = 16 } }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var fifthLabel: UILabel!
    @IBOutlet weak var sixthLabel: UILabel!
    @IBOutlet weak var seventhLabel: UILabel!
    
    var dataSelected: [String : Any] = [:]
    var typeSelected: TypeSelected = .planets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = (dataSelected["name"] as! String)
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        addGestures()
        setAllData()
    }
    
    private func addGestures() {
        let tapGestureClose = UITapGestureRecognizer(target: self, action: #selector(self.closeButtonAction(tapGestureRecognizer:)))
        closeImageView.addGestureRecognizer(tapGestureClose)
        closeImageView.isUserInteractionEnabled = true
    }
    
    @objc func closeButtonAction(tapGestureRecognizer: UITapGestureRecognizer) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.fade
        self.view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
    
    private func setAllData() {
        if typeSelected == .planets {
            planetData()
        }
        if typeSelected == .people {
            peopleData()
        }
        if typeSelected == .species {
            speciesData()
        }
        if typeSelected == .spaceships || typeSelected == .vehicles {
            spaceshipsData()
        }
    }
    
    private func planetData() {
        firstLabel.text = "Periodo rotación: \(String(describing: dataSelected["rotation_period"] as! String))"
        secondLabel.text = "Periodo orbital: \(String(describing: dataSelected["orbital_period"] as! String))"
        thirdLabel.text = "Diámetro: \(String(describing: dataSelected["diameter"] as! String))"
        fourthLabel.text = "Clima: \(String(describing: dataSelected["climate"] as! String))"
        fifthLabel.text = "Gravedad: \(String(describing: dataSelected["gravity"] as! String))"
        sixthLabel.text = "Terreno: \(String(describing: dataSelected["terrain"] as! String))"
        seventhLabel.text = "Población: \(String(describing: dataSelected["population"] as! String))"
    }
    
    private func peopleData() {
        firstLabel.text = "Altura: \(String(describing: dataSelected["height"] as! String))"
        secondLabel.text = "Peso: \(String(describing: dataSelected["mass"] as! String))"
        thirdLabel.text = "Color de pelo: \(String(describing: dataSelected["hair_color"] as! String))"
        fourthLabel.text = "Color de piel: \(String(describing: dataSelected["skin_color"] as! String))"
        fifthLabel.text = "Color de ojos: \(String(describing: dataSelected["eye_color"] as! String))"
        sixthLabel.text = "Año Nacimiento: \(String(describing: dataSelected["birth_year"] as! String))"
        seventhLabel.text = "Género: \(String(describing: dataSelected["gender"] as! String))"
    }
    
    private func speciesData() {
        firstLabel.text = "Clasificación: \(String(describing: dataSelected["classification"] as! String))"
        secondLabel.text = "Designación: \(String(describing: dataSelected["designation"] as! String))"
        thirdLabel.text = "Altura media: \(String(describing: dataSelected["average_height"] as! String))"
        fourthLabel.text = "Colores de piel: \(String(describing: dataSelected["skin_colors"] as! String))"
        fifthLabel.text = "Colores de pelo: \(String(describing: dataSelected["hair_colors"] as! String))"
        sixthLabel.text = "Colores de ojos: \(String(describing: dataSelected["eye_colors"] as! String))"
        seventhLabel.text = "Idioma: \(String(describing: dataSelected["language"] as! String))"
    }
    
    private func spaceshipsData() {
        firstLabel.text = "Modelo: \(String(describing: dataSelected["model"] as! String))"
        secondLabel.text = "Manufacturador: \(String(describing: dataSelected["manufacturer"] as! String))"
        thirdLabel.text = "Longitud: \(String(describing: dataSelected["length"] as! String))"
        fourthLabel.text = "Atm. velocidad: \(String(describing: dataSelected["max_atmosphering_speed"] as! String))"
        fifthLabel.text = "Crew: \(String(describing: dataSelected["crew"] as! String))"
        sixthLabel.text = "Pasajeros: \(String(describing: dataSelected["passengers"] as! String))"
        seventhLabel.text = "Coste en créditos: \(String(describing: dataSelected["cost_in_credits"] as! String))"
    }
}
