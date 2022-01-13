//
//  OnboardingView.swift
//  CitySights
//
//  Created by McKenzie Macdonald on 1/13/22.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var tabSelection = 0
    
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)
    
    var body: some View {
        VStack (spacing: 20) {
            
            TabView(selection: $tabSelection) {
                
                // First Tab
                VStack {
                    Image("city2")
                        .resizable()
                        .scaledToFit()
                    Text("Welcome to CitySights!")
                        .bold()
                        .font(.title)
                    Text("CitySights helps you find the best of the city!")
                        .padding(.top)
                }
                .tag(0)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                
                // Second Tab
                VStack (spacing: 20) {
                    Image("city1")
                        .resizable()
                        .scaledToFit()
                    Text("Ready to discover your city?")
                        .bold()
                        .font(.title)
                    Text("We'll show you the best restaurants, venues, and more based on your location!")
                        .padding(.top)
                }
                .tag(1)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            
            // Button
            Button {
                
                if tabSelection == 0 {
                    tabSelection = 1
                } else {
                    model.requestGeolocationPermission()
                }
                
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(height: 48)
                    
                    Text(tabSelection == 0 ? "Next" : "Get My Location")
                        .bold()
                        .padding()
                }
            }
            .accentColor(tabSelection == 0 ? blue : turquoise)
            .padding()
            
            Spacer()

        }
        .background(tabSelection == 0 ? blue : turquoise)
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
