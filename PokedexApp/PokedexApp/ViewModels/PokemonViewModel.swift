//
//  PokemonViewModel.swift
//  PokedexApp
//
//  Created by Stefan Bayne on 11/23/22.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: PokemonDetail?
    @Published var pokemonStats: SpecificStat?
    @Published var pokemonTypes: SpecificType?
    @Published var searchText = ""
    
    // search to filter pokemon
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter{
            $0.name.contains(searchText.lowercased())
        }
    }
    
    // make sure data is loading
    init() {
        self.pokemonList = pokemonManager.getPokemon()
        print(self.pokemonList)
    }
    
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    func getDetails(pokemon: Pokemon) {
        let id = getPokemonIndex(pokemon: pokemon)
        
        self.pokemonDetails = PokemonDetail(id: 0, height: 0, weight: 0, stats: [PokemonStats(base_stat: 0, effort: 0, stat: SpecificStat(name: "", url: ""))], types: [PokemonTypes(slot:0, type: SpecificType(name: "", url: ""))])
        self.pokemonStats = SpecificStat(name: "", url: "")
        self.pokemonTypes = SpecificType(name: "", url: "")
        
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetails = data
            }
        }
        pokemonManager.getPokemonStats(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonStats = data
            }
        }
        pokemonManager.getPokemonTypes(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonTypes = data
            }
        }
    }
    
    // format height and weight of JSON
    func formatHW(value: Int) -> String {
        let doubleValue = Double(value)
        let string = String(format: "%.2f", doubleValue / 10)
        
        return string
    }
}
