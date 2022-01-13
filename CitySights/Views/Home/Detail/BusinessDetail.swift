//
//  BusinessDetail.swift
//  CitySightsApp
//
//  Created by McKenzie Macdonald on 1/12/22.
//

import SwiftUI

struct BusinessDetail: View {
    
    var business: Business
    @State private var showDirections = false
    
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
                
                HStack {
                    BusinessTitle(business: business)
                        .padding(.bottom)
                    Spacer()
                    YelpAttribution(link: business.url!)
                        .padding(.trailing, -20)
                }
                
                DashedDivider()
                
                // Business Phone & Call Button
                HStack {
                    Text("Phone: ")
                        .bold()
                    Text(business.displayPhone ?? "Error")
                    Spacer()
                    Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                }
                .padding([.top, .bottom])
                DashedDivider()
                
                // Business Reviews & Read Button
                HStack {
                    Text("Reviews: ")
                        .bold()
                    Text(String(business.reviewCount ?? 0))
                    Spacer()
                    Link("Read", destination: URL(string: "\(business.url ?? "")")!)
                }
                .padding([.top, .bottom])
                DashedDivider()
                
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
                DashedDivider()
        
            }
            .padding(.horizontal)
            
            // Get Directions Button
            Button {
                showDirections = true
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
            .sheet(isPresented: $showDirections) {
                DirectionsView(business: business)
            }

        }

        
        
    }
}

//struct BusinessDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessDetail(business: )
//    }
//}
