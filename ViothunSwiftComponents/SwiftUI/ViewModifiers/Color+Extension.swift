//
//  Color+Extension.swift
//  ViothunSwiftComponents
//
//  Created by Anthony Tran on 18/06/2023.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    var random: Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
