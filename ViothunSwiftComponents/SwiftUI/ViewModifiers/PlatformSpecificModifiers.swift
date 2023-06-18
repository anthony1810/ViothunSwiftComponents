//
//  PlatformSpecificModifiers.swift
//  ViothunSwiftComponents
//
//  Created by Anthony Tran on 18/06/2023.
//

import SwiftUI


extension View {
    func watchOS<Content: View>(_ modifier: @escaping (Self) -> Content) -> some View {
        #if os(watchOS)
            modifier(self)
        #else
            self
        #endif
    }
}
