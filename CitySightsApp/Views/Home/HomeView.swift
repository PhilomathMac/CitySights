//
//  HomeView.swift
//  CitySightsApp
//
//  Created by McKenzie Macdonald on 1/11/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0 {
            
            // Determine list or map view
            if !isMapShowing {
                // Show list
                
                VStack (alignment: .leading){
                    HStack{
                        Image(systemName: "mappin.circle")
                        Text("User City")
                        Spacer()
                        Image(systemName: "map")
                    }
                    
                    Divider()
                    
                    BusinessList()
                }
                .padding([.horizontal, .top])
                
            } else {
                // TODO: Show Map
            }
            
        } else {
            // Don't have data yet so let user know to wait
            ProgressView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
