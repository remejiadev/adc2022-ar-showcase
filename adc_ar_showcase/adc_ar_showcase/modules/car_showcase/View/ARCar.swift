//
//  ARCar.swift
//  adc_ar_showcase
//
//  Created by APPLAUDO on 29/7/22.
//

import SwiftUI

struct ARCar: View {
    
    @State var currentCarAction: CarAction = .idle
    @State var hasFinishedAction: Bool = true
    
    var body: some View {
        ZStack {
            arView.edgesIgnoringSafeArea(.all)
            controls.padding()
        }
    }
    
    var controls: some View {
        VStack {
            Spacer()
            Button {
                if hasFinishedAction {
                    hasFinishedAction = false
                    currentCarAction = .forward
                }
            } label: {
                Image(systemName: "arrow.up")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .tint(.red)
            }
            .padding()
            
            HStack {
                Spacer()
                Button {
                    if hasFinishedAction {
                        hasFinishedAction = false
                        currentCarAction = .left
                    }
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .tint(.red)
                }
                .padding()
                .padding(.horizontal, 50)
                Button {
                    if hasFinishedAction {
                        hasFinishedAction = false
                        currentCarAction = .right
                    }
                } label: {
                    Image(systemName: "arrow.right")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .tint(.red)
                }
                .padding()
                .padding(.horizontal, 50)
                Spacer()
            }
            Button {
                if hasFinishedAction {
                    hasFinishedAction = false
                    currentCarAction = .backward
                }
            } label: {
                Image(systemName: "arrow.down")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .tint(.red)
            }
            .padding()
        }
    }
    
    private var arView: some View {
        ARCarView(selectedCarAction: $currentCarAction, hasFinishedMoving: $hasFinishedAction ,car: try? Car.loadApplaudoCar())
    }
}

struct ARCar_Previews: PreviewProvider {
    static var previews: some View {
        ARCar()
    }
}
