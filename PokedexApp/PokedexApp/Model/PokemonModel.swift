//
//  PokemonModel.swift
//  PokedexApp
//
//  Created by Stefan Bayne on 11/23/22.
//

import Foundation

struct PokemonPage : Codable {
    
    let count: Int
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    static var samplePokemon = Pokemon(name: "charmander",
                                       url: "https://pokeapi.co/api/v2/pokemon/4/")
}

struct PokemonDetail: Codable {
    let id: Int
    let height: Int
    let weight: Int
    let stats: [PokemonStats]
    let types: [PokemonTypes]
    
    static var samplePokemonDetails = PokemonDetail(id: 0, height: 0, weight: 0, stats: [PokemonStats(base_stat: 0, effort: 0, stat: SpecificStat(name: "charzard", url: "https://pokeapi.co/api/v2/pokemon/4/"))], types: [PokemonTypes(slot: 0, type: SpecificType(name: "charzard", url: "https://pokeapi.co/api/v2/pokemon/4/"))])
    
}

struct PokemonStats: Codable {
    let base_stat: Int
    let effort: Int
    let stat: SpecificStat
}

struct SpecificStat: Codable {
    let name: String
    let url: String
}

struct PokemonTypes: Codable {
    let slot: Int
    let type: SpecificType
}

struct SpecificType: Codable {
    let name: String
    let url: String
}
