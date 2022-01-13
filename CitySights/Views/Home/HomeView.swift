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
    @State var selectedBusiness: Business?
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0 {
            NavigationView {
                // Determine list or map view
                if !isMapShowing {
                    // Show list
                    
                    VStack (alignment: .leading){
                        HStack{
                            Image(systemName: "mappin.circle")
                            Text("User City")
                            Spacer()
                            Button {
                                self.isMapShowing = true
                            } label: {
                                Image(systemName: "map")
                            }

                        }
                        
                        Divider()
                        
                        BusinessList()
                    }
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                    
                } else {
                    BusinessMap(selectedBusiness: $selectedBusiness)
                        .ignoresSafeArea()
                        .sheet(item: $selectedBusiness) { business in
                            // Create a business detail view instance
                            // Pass in selected business
                            BusinessDetail(business: business)
                        }
                }
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
