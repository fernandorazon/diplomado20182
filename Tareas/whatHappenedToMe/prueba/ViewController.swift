//
//  ViewController.swift
//  prueba
//
//  Created by markmota on 2/24/18.
//  Copyright © 2018 markmota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Considerando que el UITextField no es el mejor objeto para regresar un texto, borré ambos UITextField de la vista y borre la instancia outletText que estaba en el codigo original del controlador
    //En su lugar, utilice un un label
    
    @IBOutlet var showLabel: UILabel!
    
    //
    @IBOutlet weak var aoutletButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //aoutletButton.setTitle("Touch me!", for: .normal)
    }

    //El sender que disparaba esta funcion no estaba definido apropiadamente, especifique que fuera un UIButton
    //Ademas, la funcion no estaba definida como una accion del controlador por lo que tuve que agregar @IBAction
    
    @IBAction func actionButton(_ sender: UIButton) {
        //outtletText.text = "You are a genius"
        showLabel.text = "You are a genious"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

