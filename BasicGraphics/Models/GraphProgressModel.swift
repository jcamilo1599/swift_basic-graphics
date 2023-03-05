//
//  GraphProgressModel.swift
//  BasicGraphics
//
//  Created by Juan Camilo Marín Ochoa on 5/03/23.
//

import SwiftUI

struct GraphProgressModel: Identifiable {
    var id = UUID().uuidString
    var progress: CGFloat
    var value: String
    var icon: String
    var mainColor: Color
    var circleColor: AngularGradient
}
