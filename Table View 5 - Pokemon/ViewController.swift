//
//  ViewController.swift
//  Table View 5 - Pokemon
//
//  Created by Eddi Raimondi on 10/10/2018.
//  Copyright © 2018 Eddi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pokemonDetail : String?
    
    @IBOutlet weak var pokemonName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonName.text = pokemonDetail
        
    }
    
    @IBAction func didClickBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        //performSegue(withIdentifier: "backToPokemonList", sender: nil)
    }
    
}
