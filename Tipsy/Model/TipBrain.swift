//
//  TipBrain.swift
//  Tipsy
//
//  Created by Enzo Rossetto on 13/01/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct TipBrain {
    var tipPercentage = 0.1
    var numberOfPeople = 2.0
    var tipAmount = "0.0"
    
    func getTipPercentage() -> String {
        "\(tipPercentage * 100)%"
    }
    
    mutating func setTipPercentage(percentage: String) {
        tipPercentage = switch percentage {
        case "20%":
            0.2
        case "10%":
            0.1
        default:
            0.0
        }
    }
    
    func getNumberOfPeople() -> String {
        String(format: "%.0f", numberOfPeople)
    }
    
    mutating func setNumberOfPeople(number: Double) {
        numberOfPeople = number
    }
    
    func getTipAmount() -> String {
        tipAmount
    }
    
    mutating func calculateTipAmount(billAmount: String) {
        let bill = Double(billAmount) ?? 0.0
        let tipTotal = bill * (1 + tipPercentage) / numberOfPeople
        tipAmount = String(format: "%.2f", tipTotal)
    }
}
