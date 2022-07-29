//
//  ARCar.swift
//  adc_ar_showcase
//
//  Created by APPLAUDO on 29/7/22.
//

import SwiftUI

struct ARCar: View {
    
    @State var currentCarAction: CarAction = .idle
    
    var body: some View {
        arView.edgesIgnoringSafeArea(.all)
        controls.padding()
    }
    
    var controls: some View {
        VStack {
            Spacer()
            Button {
                currentCarAction = .forward
            } label: {
                Image(systemName: "arrow.up")
            }
            HStack {
                Spacer()
                Button {
                    currentCarAction = .left
                } label: {
                    Image(systemName: "arrow.left")
                }
                Button {
                    currentCarAction = .right
                } label: {
                    Image(systemName: "arrow.right")
                }
                Spacer()
            }
            Button {
                currentCarAction = .backward
            } label: {
                Image(systemName: "arrow.down")
            }
        }
    }
    
    private var arView: some View {
        ARCarView(selectedCarAction: $currentCarAction ,car: try? Car.loadApplaudoCar())
    }
}

struct ARCar_Previews: PreviewProvider {
    static var previews: some View {
        ARCar()
    }
}
