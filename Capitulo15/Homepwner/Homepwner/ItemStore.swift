//
//  ItemStore.swift
//  Homepwner
//
//  Created by Fernando Razon on 7/15/18.
//  Copyright © 2018 Fernando Razon. All rights reserved.
//

import UIKit

//Esta clase guardara los items
class ItemStore {
    var allItems = [Item]()
    
//    //Este constructor genera 5 items de inicio
//    init() {
//        for _ in 0..<5 {
//            createItem()
//        }
//    }
    
    //Este metodo creara un nuevo item random llamando a un init de la clase Item
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    
    //Este metodo borra celdas
    func removeItem(_ item: Item) {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }

    //Este metodo permite cambiar el lugar que ocupa cada item en el arreglo
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return }
        // Get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        // Remove item from array
        allItems.remove(at: fromIndex)
        // Insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
    }
    
    
    
}


