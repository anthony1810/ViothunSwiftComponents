//
//  QRCodeGenerator.swift
//  ViothunSwiftUIComponents
//
//  Created by Anthony Tran on 18/06/2023.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

enum QRCodeGeneratorError: Error {
    case generateOutputFromStringFailed
    case generateCGImageFailed
}

struct QRCodeGenerator {
    
    private var context = CIContext()
    let inputString: String
    
    init(context: CIContext = CIContext(), inputString: String) {
        self.context = context
        self.inputString = inputString
    }
    
    func generate() throws -> UIImage? {
        
        let filter = CIFilter.qrCodeGenerator()
        filter.message = Data(inputString.utf8)
        
        guard let output = filter.outputImage
        else { throw QRCodeGeneratorError.generateOutputFromStringFailed }
        
        guard let cgImage = context.createCGImage(output, from: output.extent)
        else { throw QRCodeGeneratorError.generateCGImageFailed}
        
        return UIImage(cgImage: cgImage)
    }
    
}
