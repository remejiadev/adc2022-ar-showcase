//
//  ARSphere.swift
//  adc_ar_showcase
//
//  Created by APPLAUDO on 29/7/22.
//

import SwiftUI

struct ARSphere: View {
    var body: some View {
        ARSphereView().edgesIgnoringSafeArea(.all)
    }
}

struct ARSphere_Previews: PreviewProvider {
    static var previews: some View {
        ARSphere()
    }
}
