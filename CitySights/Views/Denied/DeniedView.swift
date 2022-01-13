//
//  DeniedView.swift
//  CitySights
//
//  Created by McKenzie Macdonald on 1/13/22.
//

import SwiftUI

struct DeniedView: View {
    
    let backgroundColor = Color(red: 34/255, green: 141/255, blue: 138/255)
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Whoops!")
                .font(.largeTitle)
            Text("We need to access your location to provide you with the best sights in your city.")
                .padding()
            
            Text(" You can change your decision at any time in Settings.")
                .italic()
                .padding()
                
            
            Spacer()
            
            Button {
                
                // Open Settings by getting the settings url
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                    
                }
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(height: 48)
                    
                    Text("Go to Settings")
                        .bold()
                        .padding()
                        .foregroundColor(backgroundColor)
                }
            }
            .padding()
            
            Spacer()

        }
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .background(backgroundColor)
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct DeniedView_Previews: PreviewProvider {
    static var previews: some View {
        DeniedView()
    }
}
