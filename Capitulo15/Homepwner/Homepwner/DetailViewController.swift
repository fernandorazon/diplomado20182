//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Fernando Razon on 7/16/18.
//  Copyright © 2018 Fernando Razon. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {


    //Referencias al storyboard
    @IBOutlet var nameField: UITextField!
    @IBOutlet var serialNumberField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    //Metodo que permite reconocer si el bg ha sido tapeado
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
         view.endEditing(true)
    }
    
    //Este observador de la propiedad permite que se cambie el title
    //Del NavigationBar dinamicante
    var item: Item! {
        didSet{
            navigationItem.title = item.name
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    //Se pasan los datos de la vista anterior a este y se despliegan
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        // Permite la animacion de dismiss keyboard cuando esta vista es popeada
        view.endEditing(true)
        
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        valueField.text =
            numberFormatter.string(from: NSNumber(value: item.valueInDollars))
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
    }
    
    //Se salvan los datos cuando esta vista es popeada del stack
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Clear first responder
        view.endEditing(true)
        
        // "Save" changes to item
        item.name = nameField.text ?? ""
        item.serialNumber = serialNumberField.text
        if let valueText = valueField.text,
            let value = numberFormatter.number(from: valueText) {
            item.valueInDollars = value.intValue
        } else {
            item.valueInDollars = 0
        }
    }
    
    //Metodo del protocolo del delegado del textField para desaparecer
    //el keyboard al presionar return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}













