//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Tyrone Oggen on 2021/10/11.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, operation: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(calclulationOperator: String) -> Double? {
        if let n = number {
            switch calclulationOperator {
            case "AC":
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n / 100
            case "=":
                return performTwoNumberCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, operation: calclulationOperator)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.operation {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed does not match any of the cases")
            }
        }
        return nil
    }
}
