//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipBrain = TipBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let tipPercentage = sender.currentTitle ?? "0%"
        
        zeroPctButton.isSelected = zeroPctButton.currentTitle == tipPercentage
        tenPctButton.isSelected = tenPctButton.currentTitle == tipPercentage
        twentyPctButton.isSelected = twentyPctButton.currentTitle == tipPercentage
        
        billTextField.endEditing(true)
        tipBrain.setTipPercentage(percentage: tipPercentage)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let numberOfPeople = sender.value
        splitNumberLabel.text = String(format: "%.0f", numberOfPeople)
        tipBrain.setNumberOfPeople(number: numberOfPeople)
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        tipBrain.calculateTipAmount(billAmount: billTextField.text ?? "0.0")
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tipAmount = tipBrain.getTipAmount()
            destinationVC.tipPercentage = tipBrain.getTipPercentage()
            destinationVC.numberOfPeople = tipBrain.getNumberOfPeople()
        }
    }
}

