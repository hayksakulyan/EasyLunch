//
//  ColorsForGradients.swift
//  EasyLunch
//
//  Created by Hayk Sakulyan on 07.04.23.
//

import Foundation
import UIKit

class ColorsForGradients {
    var btnGradientColor: [UIColor] = []
    var shadowGradientColor: [UIColor] = []
    
    init() {
        generateColours()
    }
    
    func generateColours() {
        btnGradientColor.append(UIColor(red: (43/255.0), green: (147/255.0), blue:(72/255.0), alpha: 1))
        btnGradientColor.append(UIColor(red: (0/255.0), green: (127/255.0), blue:(95/255.0), alpha: 1))
        btnGradientColor.append(UIColor(red: (43/255.0), green: (147/255.0), blue:(72/255.0), alpha: 1))
        shadowGradientColor.append(UIColor(red: (71/255.0), green: (75/255.0), blue:(74/255.0), alpha: 1))
        
    }
    
}
