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

class PokemonManager {
    
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
    
    // gets the pokemon stats
//    func getPokemonStats() -> SpecificStat {
//
//        // decode and get the stat
//        let data: PokemonStats = Bundle.main.decode(file: "pokemon")
//        let pokemonStat: SpecificStat = data.stat
//
//        return pokemonStat
//    }
//
//    // get the pokemon types
//    func getPokemonType() -> SpecificType {
//
//        // decode and return the types
//        let data: PokemonTypes = Bundle.main.decode(file: "pokemon")
//        let pokemonType: SpecificType = data.type
//
//        return pokemonType
//
//    }
}
