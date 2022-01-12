//
//  BusinessSectionHeader.swift
//  CitySightsApp
//
//  Created by McKenzie Macdonald on 1/11/22.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    var title: String
    
    var body: some View {
        ZStack (alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
            Text(title)
                .font(.headline)
        }
        
    }
}

struct BusinessSectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessSectionHeader(title: "TEST")
    }
}
