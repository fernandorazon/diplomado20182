//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Fernando Razon on 7/6/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            celsiusLabel.text = text
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
        
}
