//
//  CardView.swift
//  adc_ar_showcase
//
//  Created by APPLAUDO on 30/7/22.
//

import SwiftUI

struct CardView: View {
    
    let title: String
    let icon: String
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                
                VStack {
                    Spacer()
                    
                    Image(systemName: icon)
                        .font(.system(size: 32, weight: .medium))
                        .foregroundColor(Color("GenericColor"))
                    
                    Spacer()
                    
                    Text(title)
                        .foregroundColor(Color("GenericColor"))
                }
                
                Spacer()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.init(uiColor: .secondarySystemBackground))
                    .shadow(color: Color.secondary.opacity(0.85), radius: 8, x: 0, y: 0)
            )
        }
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "Hello world", icon: "car")
    }
}
