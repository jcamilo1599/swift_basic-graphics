//
//  ReduceNumber.swift
//  BasicGraphics
//
//  Created by Juan Camilo Marín Ochoa on 5/03/23.
//

import Foundation

func reduceNumber(_ number: Int) -> String {
    let formatNumber = abs(Double(number))
    let sign = (number < 0) ? "-" : ""
    
    switch formatNumber {
    case 1_000_000_000...:
        var formatted = formatNumber / 1_000_000_000
        formatted = formatted.reduce(to: 1)
        return "\(sign)\(formatted)B"
        
    case 1_000_000...:
        var formatted = formatNumber / 1_000_000
        formatted = formatted.reduce(to: 1)
        return "\(sign)\(formatted)M"
        
    case 1_000...:
        var formatted = formatNumber / 1_000
        formatted = formatted.reduce(to: 1)
        return "\(sign)\(formatted)K"
        
    case 0...:
        return "\(number)"
        
    default:
        return "\(sign)\(number)"
    }
}
