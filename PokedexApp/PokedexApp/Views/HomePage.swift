//
//  HomePage.swift
//  PokedexApp
//
//  Created by Stefan Bayne on 11/23/22.
//

import SwiftUI

struct HomePageView: View {
    
    @State var isActive = false
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("bg").ignoresSafeArea()
                
                VStack {
                    
                    Spacer()
                    
                    Image("pokemon")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 350, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.top, 30)
                        .padding()
                        .shadow(color: Color("font"), radius: 10)
                    
                    VStack {
                        
                        Spacer()
                        
                        Image("pikachu")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .padding()
                            .shadow(color: Color("font"), radius: 10)
                        
                        Spacer()
                        
                        NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                            Text("Begin")
                                .frame(width: 320, height: 80)
                                .font(.system(size: 36))
                                .foregroundColor(.white)
                                .background(Color("font"))
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                .padding(.bottom, 60)
                                .shadow(color: Color("font"), radius: 15)
                        }
                    }
                }
            }
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
