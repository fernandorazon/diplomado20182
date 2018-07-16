//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Fernando Razon on 7/15/18.
//  Copyright © 2018 Fernando Razon. All rights reserved.
//

import UIKit

//Se crea una subclase del tableviewcontroller
class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Limita el punto de inicio scrolleo de la tabla para que no se overlape con
        //la parte de arriba, ni el indicador de scroll a su vez
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Instancia de la celda con estilo default
        //let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
        //Instancia o reusa una celda
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]
        
        //Se agrega texto a las subvistas de la celda con el nombre de los items
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
}

