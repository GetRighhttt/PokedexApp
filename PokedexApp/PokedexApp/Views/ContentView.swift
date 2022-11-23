//
//  ContentView.swift
//  PokedexApp
//
//  Created by Stefan Bayne on 11/23/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("bg").ignoresSafeArea()
                VStack {
                    Text("Hello, world!")
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
