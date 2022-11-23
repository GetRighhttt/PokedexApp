//
//  PokemonDetailView.swift
//  PokedexApp
//
//  Created by Stefan Bayne on 11/23/22.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    let pokemon: Pokemon
    
    @State var showSheet = false

    var body: some View {
        ZStack {
            Color("bg").ignoresSafeArea()
            VStack {
                
                PokemonView(pokemon: pokemon)
                    .onTapGesture {
                        showSheet.toggle()
                    }
                
                VStack(spacing: 10) {
                    
                    Text("**ID**: \(viewModel.pokemonDetails?.id ?? 0)")
                        .font(.system(size: 14, weight: .regular, design: .monospaced))
                        .foregroundColor(Color("font"))
                    Text("**Height**: \(viewModel.formatHW(value: viewModel.pokemonDetails?.height ?? 0)) KG")
                        .font(.system(size: 14, weight: .regular, design: .monospaced))
                        .foregroundColor(Color("font"))
                    Text("**Weight**: \(viewModel.formatHW(value: viewModel.pokemonDetails?.weight ?? 0)) M")
                        .font(.system(size: 14, weight: .regular, design: .monospaced))
                        .foregroundColor(Color("font"))
                    
                }
                .shadow(color: Color("font"), radius: 10)
            }
            .onAppear {
                viewModel.getDetails(pokemon: pokemon)
            }
            .sheet(isPresented: $showSheet) { // we call the sheet outside of the views total stack
                BottomSheetView(pokemon: pokemon)
                    .presentationDetents([.medium, .large]) // how we control the sheets size
            }
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
