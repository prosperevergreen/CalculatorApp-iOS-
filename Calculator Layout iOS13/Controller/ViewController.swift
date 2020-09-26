//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var calcEngine = CalculatorEngine()
    
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
    
    @IBAction func numBtnPressed(_ sender: UIButton) {
        
        if let newNumber = sender.currentTitle{
            
            if let newValue = calcEngine.numberInput(prevValue: displayLabel.text!, newNumber: newNumber){
                displayLabel.text = newValue
            }
        }
    }
    
    @IBAction func singleCalcBtnPressed(_ sender: UIButton) {
        if let calcOperation = sender.currentTitle{
            if let newValue = calcEngine.singleCalc(currentValue: displayValue, operatorValue: calcOperation){
                displayValue = newValue
            }
        }
    }
    
    @IBAction func doubleCalcBtnPressed(_ sender: UIButton) {
        if let calcMethod = sender.currentTitle{
            if let newValue = calcEngine.doubleCalc(currentValue: displayValue, currentOperator: calcMethod){
                displayValue = newValue
            }
        }
    }
    
    
    @IBAction func equalBtnPressed(_ sender: UIButton) {
     
            if let newValue = calcEngine.equalCalc(currentValue: displayValue){
                displayValue = newValue
            }
    }
    
    
    
    
    
}

