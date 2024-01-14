//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Enzo Rossetto on 13/01/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var tipPercentage: String?
    var numberOfPeople: String?
    var tipAmount: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = tipAmount
        settingsLabel.text = "Split between \(numberOfPeople ?? "0") people, with \(tipPercentage ?? "0%") tip."
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
