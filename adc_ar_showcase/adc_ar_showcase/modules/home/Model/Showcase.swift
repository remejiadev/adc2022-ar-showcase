//
//  Showcase.swift
//  adc_ar_showcase
//
//  Created by APPLAUDO on 29/7/22.
//

import Foundation
import SwiftUI

enum ShowCase: String, CaseIterable, Identifiable{
    
    var id : String { UUID().uuidString }
    
    case applaudoCar = "AR Car"
    case arSphere = "AR Sphere"
}

// MARK: - ShowCase View

extension ShowCase {
    var destination: some View {
        switch self {
        case .applaudoCar:
            return AnyView(ARCar())
        case .arSphere:
            return AnyView(ARSphere())
        }
    }
}
