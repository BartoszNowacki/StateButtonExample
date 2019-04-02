//
//  ColorConverter.swift
//  StateButtonExample
//
//  Created by Bartosz Nowacki on 02/04/2019.
//  Copyright © 2019 Bartosz Nowacki. All rights reserved.
//

import UIKit

class ColorConverter {

    /// This function get String color name, from UIColor. This color must be in base colors.
    /// - parameters: color - color for which you are getting String name
    /// - returns: String - string representation of Color
    static func getColor(_ color: UIColor) -> String {
        let colors = [UIColor.red:"red", UIColor.blue:"blue", UIColor.yellow:"yellow", UIColor.green:"green"]
        var colorString = ""
        if colors.keys.contains(color){
            colorString = colors[color]!
        }
        if colorString != "" {
            return colorString
        } else {
            fatalError("There is no such color in base colors")
        }
    }
}
