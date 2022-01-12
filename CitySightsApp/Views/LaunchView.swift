//
//  ContentView.swift
//  CitySightsApp
//
//  Created by McKenzie Macdonald on 1/10/22.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel

    
    var body: some View {
        
        // Detect the authorization status of geolocating user
        if model.authorizationState == .notDetermined {
            // If undetermined, show onboarding
            
        } else if model.authorizationState == .authorizedAlways || model.authorizationState == .authorizedWhenInUse {
            // If approved, show HomeView
            HomeView()
        } else {
            // If denied, show DeniedView
            
        }
        
//        switch model.authorizationState {
//        case .notDetermined:
//            // show onboarding
//        case .
//        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
