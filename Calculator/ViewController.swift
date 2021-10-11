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
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display label text to a Double.")
        }
        
        if let calculationMethod = sender.currentTitle {
            switch calculationMethod {
            case "AC":
                displayLabel.text = "0"
            case "+/-":
                displayLabel.text = String(number * -1)
            case "%":
                displayLabel.text = String(number / 100)
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
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("Cannot convert display label text to a Double.")
                    }
                    
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numberValue
            }
        }
    }

}

