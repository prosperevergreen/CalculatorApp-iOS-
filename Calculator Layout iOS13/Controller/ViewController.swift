//
//  CalculatorEngine.swift
//  Calculator Layout iOS13
//
//  Created by Prosper Evergreen on 22.09.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    // create game engine
    private var calcEngine = CalculatorEngine()
    
    // Display values accessed & updated using computed variable
    private var displayValue: Double{
        get{
            guard let num = Double(displayLabel.text!)else{
                fatalError("cannot convert display text to a Double")
            }
            return num
        }
        set{
            displayLabel.text = String(format: "%.1f", newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //On number button pressed runs the function
    @IBAction func numBtnPressed(_ sender: UIButton) {
        
        //get the current number if
        if let newNumber = sender.currentTitle{
            
            //update the UI with the pressed number
            if let newValue = calcEngine.numberInput(prevValue: displayLabel.text!, newNumber: newNumber){
                displayLabel.text = newValue
            }
        }
    }
    
    //on button pressed for single operand and operator calculation
    @IBAction func singleCalcBtnPressed(_ sender: UIButton) {
        if let calcOperation = sender.currentTitle{
            if let newValue = calcEngine.singleCalc(currentValue: displayValue, operatorValue: calcOperation){
                displayValue = newValue
            }
        }
    }
    
    //on button pressed for two operands and one operator calculation
    @IBAction func doubleCalcBtnPressed(_ sender: UIButton) {
        if let calcMethod = sender.currentTitle{
            if let newValue = calcEngine.doubleCalc(currentValue: displayValue, currentOperator: calcMethod){
                displayValue = newValue
            }
        }
    }
    
    //on eqaul button pressed
    @IBAction func equalBtnPressed(_ sender: UIButton) {
        
        if let newValue = calcEngine.equalCalc(currentValue: displayValue){
            displayValue = newValue
        }
    }
    
    
}

