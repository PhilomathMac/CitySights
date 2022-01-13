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
                .frame(height: 40)
            Text(title)
                .font(.headline)
        }
        .padding(.trailing, -20)
        
    }
}

struct BusinessSectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessSectionHeader(title: "TEST")
    }
}
