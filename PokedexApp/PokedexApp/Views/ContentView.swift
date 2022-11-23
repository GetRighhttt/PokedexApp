//
//  ContentView.swift
//  PokedexApp
//
//  Created by Stefan Bayne on 11/23/22.
//

import SwiftUI

/**
 Here we show how to style the navigation link back button and how to use an environment object with multiple views.
 */
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
                            }.foregroundColor(Color("font"))
                        }
                    } // animation of views
                    .animation(.easeIn(duration: 0.3), value: viewModel.filteredPokemon.count)
                    .navigationTitle("Pokedex")
                    .padding()
                }.searchable(text: $viewModel.searchText)
                .shadow(color: Color("font"), radius: 10)
            }
        }.environmentObject(viewModel)
            .accentColor(Color("font"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
