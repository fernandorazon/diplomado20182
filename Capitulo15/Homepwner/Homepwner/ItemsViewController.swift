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
    
    //Formato a las celdas
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
    
    //Borrar tanto en el itemStore como de la tabla
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            //Se agrega un AlertController antes de borrar una celda
            let title = "Delete \(item.name)?"
            let message = "Are you sure you want to delete this item?"
            let ac = UIAlertController(title: title,message: message, preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive,
                                             handler: { (action) -> Void in
                                                // Remove the item from the store
                                                self.itemStore.removeItem(item)
                                                // Also remove that row from the table view with an animation
                                                self.tableView.deleteRows(at: [indexPath], with: .automatic) })
            ac.addAction(deleteAction)
            // Present the alert controller
            present(ac, animated: true, completion: nil)
        }
    }
    
    //Mover las celdas tanto en la tabla como en el item store
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    //Estos metodos son llamados al tapear los botones correspondientes
    
    @IBAction func addNewItem(_ sender: UIButton) {
        
//        // Make a new index path for the 0th section, last row
//        let lastRow = tableView.numberOfRows(inSection: 0)
//        let indexPath = IndexPath(row: lastRow, section: 0)
//        // Insert this new row into the table
//        tableView.insertRows(at: [indexPath], with: .automatic)
        
        // Create a new item and add it to the store
        let newItem = itemStore.createItem()
        // Figure out where that item is in the array
        if let index = itemStore.allItems.index(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            // Insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
    }
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        
        // If you are currently in editing mode...
        if isEditing {
            // Change text of button to inform user of state
            sender.setTitle("Edit", for: .normal)
            // Turn off editing mode
            setEditing(false, animated: true)
        } else {
            // Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            // Enter editing mode
            setEditing(true, animated: true)
        }
        
    }

    
}

