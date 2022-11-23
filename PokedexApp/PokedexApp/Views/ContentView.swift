//
//  ContentView.swift
//  PokedexApp
//
//  Created by Stefan Bayne on 11/23/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 250)),
        GridItem(.adaptive(minimum: 250)),
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("bg").ignoresSafeArea()
                ScrollView {
                    LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                        ForEach(viewModel.filteredPokemon) { pokemon in
                            NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                                PokemonView(pokemon: pokemon)
                            }
                        }
                    }
                }.shadow(color: Color("font"), radius: 10)
            }
        }.environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
