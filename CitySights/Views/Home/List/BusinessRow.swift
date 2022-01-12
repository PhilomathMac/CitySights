//
//  BusinessRow.swift
//  CitySightsApp
//
//  Created by McKenzie Macdonald on 1/11/22.
//

import SwiftUI

struct BusinessRow: View {
    
    @ObservedObject var business: Business
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                
                //Image
                let uiImage = UIImage(data: business.imageData ?? Data())
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .frame(width: 58, height: 58)
                    .cornerRadius(5)
                    .scaledToFit()
                
                VStack (alignment: .leading) {
                    
                    // Name
                    Text(business.name ?? "Error")
                        .bold()
                    
                    // Distance
                    Text(String(format:"%.1f km away", (business.distance ?? 0)/1000))
                        .font(.caption)
                }
                
                Spacer()
                
                VStack (alignment: .leading) {
                    // Rating
                    Image("regular_\(business.rating ?? 0.0)")
                    // Review Number
                    Text("\(business.reviewCount ?? 0) Reviews")
                        .font(.caption)
                }
            }
        }.foregroundColor(.black)
    }
}

//struct BusinessRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessRow()
//    }
//}
