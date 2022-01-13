//
//  DirectionsView.swift
//  CitySights
//
//  Created by McKenzie Macdonald on 1/13/22.
//

import SwiftUI

struct DirectionsView: View {
   
    var business: Business
    
    var body: some View {
        VStack (alignment: .leading) {
            
            // Business Title
            VStack (alignment: .leading) {
                BusinessTitle(business: business)
                
                if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude, let name = business.name {
                    if let nameURLFormat = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                        Link("Open in Maps", destination: URL(string: "http://maps.apple.com/?ll=\(lat),\(long)&q=\(nameURLFormat)")!)
                            .padding([.top, .bottom])
                    }
                }
                
            }
            .padding()
            // DirectionsMap
            DirectionsMap(business: business)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

//struct DirectionsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DirectionsView()
//    }
//}
