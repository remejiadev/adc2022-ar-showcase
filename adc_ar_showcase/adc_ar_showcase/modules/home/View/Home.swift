//
//  Home.swift
//  adc_ar_showcase
//
//  Created by APPLAUDO on 29/7/22.
//

import SwiftUI

struct Home: View {
    
    let height: CGFloat = 250
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Label("ADC - ARKit", systemImage: "")
                        .labelStyle(TitleOnlyLabelStyle())
                        .font(.system(size: 25, weight: .medium))
                        .foregroundColor(Color("GenericColor"))
                    
                    Spacer()
                }
                .padding([.top, .leading], 30.0)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(ShowCase.allCases, id: \.self, content: { item in
                            NavigationLink(destination: item.destination) {
                                CardView(title: item.rawValue, icon: item.icon)
                                    .frame(height: height)
                            }
                        })
                    }
                    .padding()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
