//
//  ViewController.swift
//  Table View 5 - Pokemon
//
//  Created by Eddi Raimondi on 10/10/2018.
//  Copyright © 2018 Eddi. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    var pokemonDetail : PokemonList?
    
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonName.text = pokemonDetail?.name
        pokImg.image = pokemonDetail?.getImage()
        
    }
    
    @IBAction func didClickBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        //performSegue(withIdentifier: "backToPokemonList", sender: nil)
    }
    
}
