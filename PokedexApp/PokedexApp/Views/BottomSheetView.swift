//
//  BottomSheetView.swift
//  PokedexApp
//
//  Created by Stefan Bayne on 11/23/22.
//

import SwiftUI

struct BottomSheetView: View {
    @EnvironmentObject var viewModel: ViewModel
    let pokemon: Pokemon
    let dimension: Double = 140
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        ZStack {
            VStack {
                AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(viewModel.getPokemonIndex(pokemon: pokemon)).png")) { image in
                    
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: dimension, height: dimension)
                    }
                } placeholder: {
                    ProgressView()
                        .frame(width: dimension, height: dimension)
                }
                .background(.thinMaterial)
                .clipShape(Circle())
                
                Text("\(pokemon.name.capitalized)")
                    .font(.system(size: 25, weight: .heavy, design: .monospaced))
                    .padding()
                Button("Go to JSON") {
                    openURL(URL(string: "\(pokemon.url)")!)
                        }
                .font(.system(size: 22, weight: .heavy, design: .monospaced))
                .padding()
                .background(Color("bg"))
                .cornerRadius(10)
            }.foregroundColor(Color("font"))
            .shadow(color: Color("font"), radius: 10)

        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
