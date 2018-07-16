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
    
    //Este constructor genera 5 items de inicio
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    //Este metodo creara un nuevo item random llamando a un init de la clase Item
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }

    
}


