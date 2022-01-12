//
//  BusinessDetail.swift
//  CitySightsApp
//
//  Created by McKenzie Macdonald on 1/12/22.
//

import SwiftUI

struct BusinessDetail: View {
    
    var business: Business
    
    var body: some View {
        VStack (alignment: .leading){
            
            VStack (alignment: .leading, spacing: 0) {
                GeometryReader() { geo in
                    // Business Image
                    let uiImage = UIImage(data: business.imageData ?? Data())
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                }
                .ignoresSafeArea(.all, edges: .top)
                
                // Open or Closed Bar
                ZStack (alignment: .leading) {
                    Rectangle()
                        .frame(height: 36)
                        .foregroundColor((business.isClosed ?? false) ? .gray : .blue)
                    Text((business.isClosed ?? false) ? "Closed" : "Open")
                        .foregroundColor(.white)
                        .padding(.leading)
                }
            }
            
            // Business Details
            Group {
                
                // Name
                Text(business.name ?? "Error")
                    .font(.largeTitle)
                    .padding([.top, .bottom])
                
                // Address
                if business.location?.displayAddress != nil {
                    ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                        Text(displayLine)
                    }
                }
                
                // Rating
                Image("regular_\(business.rating ?? 0)")
                    .padding([.top, .bottom])
                
                Divider()
                
                // Business Phone & Call Button
                HStack {
                    Text("Phone: ")
                        .bold()
                    Text(business.displayPhone ?? "Error")
                    Spacer()
                    Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                }
                .padding([.top, .bottom])
                Divider()
                
                // Business Reviews & Read Button
                HStack {
                    Text("Reviews: ")
                        .bold()
                    Text(String(business.reviewCount ?? 0))
                    Spacer()
                    Link("Read", destination: URL(string: "\(business.url ?? "")")!)
                }
                .padding([.top, .bottom])
                Divider()
                
                // Yelp Website
                HStack {
                    Text("Yelp Page: ")
                        .bold()
                    Text(business.url ?? "Error")
                        .lineLimit(1)
                    Spacer()
                    Link("Visit", destination: URL(string: "\(business.url ?? "")")!)
                }
                .padding([.top, .bottom])
                Divider()
        
            }
            .padding(.horizontal)
            
            // Get Directions Button
            Button {
                //TODO: Get directions
            } label: {
                ZStack {
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                    
                    Text("Get Directions")
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .padding()

        }

        
        
    }
}

//struct BusinessDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessDetail(business: )
//    }
//}
