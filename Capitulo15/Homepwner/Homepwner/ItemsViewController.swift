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
    
    //Agregamos el boton de editar automaticamente en este constructor
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Para computar el tamanio de celda basado en constraints
        tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.estimatedRowHeight = 65
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    //Formato a las celdas
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        let item = itemStore.allItems[indexPath.row]
        
        // Configure the cell with the Item
        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text = item.serialNumber
        cell.valueLabel.text = "$\(item.valueInDollars)"
        
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
    
    //Permite pasar el item que fue seleccionado al siguiente controlador
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered segue is the "showItem" segue
        switch segue.identifier {
        case "showItem"?:
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                // Get the item associated with this row and pass it along
                let item = itemStore.allItems[row]
                let detailViewController
                    = segue.destination as! DetailViewController
                detailViewController.item = item
            } default:
                preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    //Recarga la tabla cuando vuelve a aparecer para que los datos cambiados se presenten adecuadamente
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //Estos metodos son llamados al tapear los botones correspondientes
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        
        // Create a new item and add it to the store
        let newItem = itemStore.createItem()
        // Figure out where that item is in the array
        if let index = itemStore.allItems.index(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            // Insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
    }
    
}

