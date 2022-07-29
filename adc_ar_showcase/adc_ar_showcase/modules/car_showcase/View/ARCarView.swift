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
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let tank = try! Car.loadApplaudoCar()
        arView.scene.anchors.append(tank)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
    }
}
