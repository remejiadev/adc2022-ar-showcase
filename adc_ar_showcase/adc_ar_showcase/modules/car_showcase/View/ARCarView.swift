//
//  ARCarView.swift
//  adc_ar_showcase
//
//  Created by APPLAUDO on 29/7/22.
//

import Foundation
import SwiftUI
import RealityKit

struct ARCarView: UIViewRepresentable {
    
    @Binding var selectedCarAction: CarAction
    let car: Car.ApplaudoCar?
    
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        if let car = car {
            arView.scene.anchors.append(car)
        }
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if selectedCarAction != .idle {
            executeCarAction(selectedAction: selectedCarAction)
            selectedCarAction = .idle
        }
    }
    
    func executeCarAction(selectedAction: CarAction) {
        switch selectedAction {
        case .forward:
            car?.notifications.carForward.post()
        case .right:
            car?.notifications.carRIght.post()
        case .left:
            car?.notifications.carLeft.post()
        case .backward:
            car?.notifications.carBackward.post()
        case .idle:
            break
        }
    }
}
