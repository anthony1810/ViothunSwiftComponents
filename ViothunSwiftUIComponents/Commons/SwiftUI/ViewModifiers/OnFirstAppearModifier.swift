//
//  OnFirstAppearModifier.swift
//  ViothunSwiftComponents
//
//  Created by Anthony Tran on 18/06/2023.
//

import SwiftUI

struct OnFirstViewAppear: ViewModifier {
    
    @State private var hasAppeared: Bool = false
    let perform: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                guard !hasAppeared else { return }
                hasAppeared = true
                perform()
            }
    }
}

extension View {
    func onFirstViewAppear(perform: @escaping () -> Void) -> some View {
        modifier(OnFirstViewAppear(perform: perform))
    }
}
