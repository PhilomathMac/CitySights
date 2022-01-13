//
//  DashedDivider.swift
//  CitySights
//
//  Created by McKenzie Macdonald on 1/13/22.
//

import SwiftUI

struct DashedDivider: View {
    var body: some View {
        
        GeometryReader { geo in
            
            Path { path in
                path.move(to: CGPoint.zero)
                path.addLine(to: CGPoint(x: geo.size.width, y: 0))
            }
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
            .foregroundColor(.gray)
            
        }
        .frame(height: 1)
        
    }
}

struct DashedDivider_Previews: PreviewProvider {
    static var previews: some View {
        DashedDivider()
    }
}
