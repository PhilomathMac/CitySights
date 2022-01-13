//
//  BusinessTitle.swift
//  CitySights
//
//  Created by McKenzie Macdonald on 1/13/22.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
        
        VStack (alignment: .leading) {
            // Name
            Text(business.name ?? "Error")
                .font(.title2)
                .bold()
                .padding(.vertical)
            
            // Address
            if business.location?.displayAddress != nil {
                ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                    Text(displayLine)
                }
            }
            
            // Rating
            Image("regular_\(business.rating ?? 0)")
        }
    }
}

//struct BusinessTitle_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessTitle()
//    }
//}
