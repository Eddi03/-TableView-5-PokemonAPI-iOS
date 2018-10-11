//
//  PokemonTableViewController.swift
//  Table View 5 - Pokemon
//
//  Created by Eddi Raimondi on 10/10/2018.
//  Copyright © 2018 Eddi. All rights reserved.
//

import UIKit

class PokemonTableViewController: UITableViewController {
    
    var pokemons : [PokemonList] = []
    var activityIndicator : UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Pokemon.getPokemons(self)
    }
    
    // Numero di sezioni della tabella
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // Numero di righe per ogni sezione della tabella
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokemons.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let pok = pokemons[indexPath.row]
        cell.textLabel?.text = pok.name
        cell.imageView?.image = pok.getImage()
        
        return cell
    }
    
    // Apre la pagina con il dettaglio del Pokemon
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pok = pokemons[indexPath.row]
        performSegue(withIdentifier: "pokemonDetail", sender: pok)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pokemonDetail" {
            let viewCon = segue.destination as! PokemonDetailViewController
            let poke = sender as! PokemonList
            viewCon.pokemonDetail = poke
        }
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
