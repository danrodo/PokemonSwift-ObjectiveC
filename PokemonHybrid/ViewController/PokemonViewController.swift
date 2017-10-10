//
//  PokemonViewController.swift
//  PokemonHybrid
//
//  Created by Daniel Rodosky on 10/10/17.
//  Copyright © 2017 Daniel Rodosky. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self

    }
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilityLabel: UILabel!
    
    var pokemon: Pokemon? {
        didSet{
            updateViews()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchBarText = searchBar.text else { return }
        PokemonController.shared().fetchPokemon(forSearchTerm: searchBarText) { (pokemon) in
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }
        
    }
    
    func updateViews() {
        guard let pokemon = pokemon else { return }
        nameLabel.text = pokemon.name
        idLabel.text = "\(pokemon.identifier)"
        abilityLabel.text = "\(pokemon.abilities)"
        
    }

}
