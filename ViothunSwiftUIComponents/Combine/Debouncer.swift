//
//  Debouncer.swift
//  ViothunSwiftComponents
//
//  Created by Anthony Tran on 18/06/2023.
//

import Combine
import SwiftUI

class Debouncer<T>: ObservableObject {
    @Published var input: T
    @Published var output: T
    
    private var cancellable: AnyCancellable?
    
    init(initialValue: T, delay: Double = 1, queue: DispatchQueue) {
        self.input = initialValue
        self.output = initialValue
        
        cancellable = $input
            .debounce(for: .seconds(delay), scheduler: queue)
            .sink(receiveValue: { [weak self] in
                self?.output = $0
            })
    }
}
