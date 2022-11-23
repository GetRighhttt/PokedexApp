//
//  Splash.swift
//  PokedexApp
//
//  Created by Stefan Bayne on 11/23/22.
//

import SwiftUI

struct Splash: View {
    @State var animate = false
    @State var endSplash = false
    
    var body: some View {
        
        /*
         Fade Animation - realistic example.
         */
        ZStack {
            ContentView()
            
            ZStack {
                Color("bg")
                Image("pokemon")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    .clipShape(Circle())
                    .foregroundColor(Color("font"))
                    .background(Color("bg"))
                    .cornerRadius(120)
            }
            .ignoresSafeArea()
            .onAppear(perform: animateSplash)
            .opacity(endSplash ? 0 : 1)
        }
    }
    
    func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            
            withAnimation(Animation.easeOut(duration: 0.5)) {
                animate.toggle()
                endSplash.toggle()
            }
        }
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
