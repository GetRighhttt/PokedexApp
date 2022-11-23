//
//  DataManager.swift
//  PokedexApp
//
//  Created by Stefan Bayne on 11/23/22.
//

import Foundation

/**
 Makes it easier for us to retrieve data in ViewModel
 */

class PokemonManager: ObservableObject {
    
    // gets the list of all pokemon
    func getPokemon() -> [Pokemon] {
        
        // decode and get the results.
        let data: PokemonPage = Bundle.main.decode(file: "pokemon.json")
        let pokemon: [Pokemon] = data.results
        
        return pokemon
    }
    
    func getDetailedPokemon(id: Int, _ completion:@escaping(PokemonDetail) -> ()) {
        
        // call our fetch data method to get the details and return the data or an error
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/",
                              model: PokemonDetail.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func getPokemonStats(id: Int, _ completion:@escaping(SpecificStat) -> ()) {
        
        // call our fetch data method to get the details and return the data or an error
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/",
                              model: SpecificStat.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func getPokemonTypes(id: Int, _ completion:@escaping(SpecificType) -> ()) {
        
        // call our fetch data method to get the details and return the data or an error
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/",
                              model: SpecificType.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
}
