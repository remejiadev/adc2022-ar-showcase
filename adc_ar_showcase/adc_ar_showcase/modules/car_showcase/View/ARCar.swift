//
//  ARCar.swift
//  adc_ar_showcase
//
//  Created by APPLAUDO on 29/7/22.
//

import SwiftUI

struct ARCar: View {
    
    var body: some View {
            arView.edgesIgnoringSafeArea(.all)
    }
    
    private var arView: some View {
        ARCarView()
    }
}

struct ARCar_Previews: PreviewProvider {
    static var previews: some View {
        ARCar()
    }
}
