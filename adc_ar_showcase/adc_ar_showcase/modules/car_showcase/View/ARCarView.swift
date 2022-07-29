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
    @Binding var hasFinishedMoving: Bool
    let car: Car.ApplaudoCar?
    
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        arView.addCoaching()
        
        if let car = car {
            car.actions.movedForward.onAction = self.setToIdle(entity:)
            car.actions.movedBackward.onAction = self.setToIdle(entity:)
            car.actions.movedLeft.onAction = self.setToIdle(entity:)
            car.actions.movedRight.onAction = self.setToIdle(entity:)
            arView.scene.anchors.append(car)
        }
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if selectedCarAction != .idle {
            executeCarAction(selectedAction: selectedCarAction)
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
    
    func setToIdle(entity: Entity?) {
        selectedCarAction = .idle
        hasFinishedMoving = true
    }
}
