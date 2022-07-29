//
//  Showcase.swift
//  adc_ar_showcase
//
//  Created by APPLAUDO on 29/7/22.
//

import Foundation

enum ShowCase: String, CaseIterable, Identifiable{
    
    var id : String { UUID().uuidString }
    
    case applaudoCar = "AR Car"
}
