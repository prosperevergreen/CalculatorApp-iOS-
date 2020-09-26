//
//  CalculatorEngine.swift
//  Calculator Layout iOS13
//
//  Created by Prosper Evergreen on 22.09.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

class CalculatorEngine{
    
    private var isFinishedTyping: Bool = true
    private var isDouble: Bool = false
    private var prevNumber: Double?
    private var prevOperator: String?
    private var canEqual: Bool = true
    
    
    
    
    func singleCalc(currentValue: Double, operatorValue: String)->Double?{
        isFinishedTyping = true
        isDouble = false
        
        var newValue: Double?
        prevNumber = nil
        prevOperator = nil
        
        switch operatorValue {
        case "+/-":
            newValue = currentValue * -1
            break
        case "AC":
            newValue = 0
            break
        case "%":
            newValue = currentValue * 0.01
        default:
            break
        }
        return newValue
    }
    
    func calc(firstNum: Double, sign: String, secondNum: Double) -> Double? {
        var newValue: Double?
        switch sign {
        case "+":
            newValue = firstNum + secondNum
        case "-":
            newValue = firstNum - secondNum
        case "×":
            newValue = firstNum * secondNum
        case "÷":
            newValue = firstNum / secondNum
        default:
            break
        }
        return newValue
    }
    
    func doubleCalc(currentValue: Double, currentOperator: String)->Double?{
        isFinishedTyping = true
        isDouble = false
        var newValue: Double? = currentValue
        if let prevInput = prevNumber, let prevSign = prevOperator{
            newValue = calc(firstNum: prevInput, sign: prevSign, secondNum: currentValue)
        }
        prevOperator = currentOperator
        prevNumber = newValue
        
        return newValue
    }
    
    
    func numberInput(prevValue: String, newNumber: String) -> String? {
        
        var newInput: String?
        
        if isFinishedTyping{
            if newNumber == "."{
                newInput = "0."
            }else{
                newInput = newNumber
            }
            
            isFinishedTyping = false
        }else if !isDouble || newNumber != "."{
            newInput = prevValue + newNumber
            isDouble = newNumber == "." ? true : isDouble
        }
        
        return newInput
    }
    
    func equalCalc(currentValue: Double) ->Double?{
        var result: Double?
        if let prevInput = prevNumber, let prevSign = prevOperator{
            result = calc(firstNum: prevInput, sign: prevSign, secondNum: currentValue)
            prevNumber = nil
            prevOperator = nil
            return result
        }else{
            return currentValue
        }
    }
}
