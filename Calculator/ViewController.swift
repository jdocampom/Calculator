//
//  ViewController.swift
//  Calculator
//
//  Created by Juan Diego Ocampo on 23/12/2020.
//  Copyright ©2020 Juan Diego Ocampo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- Variables
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber: Bool = true
    
    // MARK:- Calculator Methods
    
    /// Tag: calcButtonPressed()
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        // What should happen when a non-number button is pressed...
        isFinishedTypingNumber = true
        guard let number = Double(displayLabel.text!) else {
            fatalError("Can't convert displayLabel.text to a Double")
        }
        // One number operations (AC, +/-, %)
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else if calcMethod == "%" {
                displayLabel.text = String(number / 100)
            }
        }
        // Two number operations (+, -, *, /, =)
        
    }
    
    /// Tag: numButtonPressed()
    @IBAction func numButtonPressed(_ sender: UIButton) {
        // What should happen when a number is entered into the keypad...
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber == true {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("Can't convert displayLabel.text to a Double")
                    }
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
}
