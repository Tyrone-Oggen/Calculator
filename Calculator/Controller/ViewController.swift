//
//  ViewController.swift
//  Calculator
//
//  Created by Tyrone Oggen on 2021/10/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true
        
        
        
        if let calculationMethod = sender.currentTitle {
            switch calculationMethod {
            case "AC":
                displayLabel.text = "0"
            case "+/-":
                displayValue *= -1
            case "%":
                displayValue /= 100
            default:
                return
            }
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numberValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numberValue
                isFinishedTypingNumber = false
            } else {
                if numberValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numberValue
            }
        }
    }

}

