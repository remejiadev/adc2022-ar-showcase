//
//  Home.swift
//  adc_ar_showcase
//
//  Created by APPLAUDO on 29/7/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView {
            List(ShowCase.allCases, id: \.id) { showCase in
                NavigationLink {
                    ARCar()
                } label: {
                    Text(showCase.rawValue)
                }
            }
            .navigationTitle("ADC")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
