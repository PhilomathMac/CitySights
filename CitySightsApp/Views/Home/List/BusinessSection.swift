//
//  BusinessSection.swift
//  CitySightsApp
//
//  Created by McKenzie Macdonald on 1/11/22.
//

import SwiftUI

struct BusinessSection: View {
    
    var title: String
    var businesses: [Business]
    
    var body: some View {
        
        Section (header: BusinessSectionHeader(title: title)) {
            ForEach(businesses) { business in
                
                BusinessRow(business: business)
                Divider()
                
            }
        }
    }
}

//struct BusinessSectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessSection()
//    }
//}
