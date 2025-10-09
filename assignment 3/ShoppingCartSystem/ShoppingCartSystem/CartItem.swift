//
//  File.swift
//  ShoppingCartSystem
//
//  Created by Арсен Абдухалық on 01.10.2025.
//

import Foundation

// TODO: Implement CartItem struct
struct CartItem {
    // TODO: Add properties
    var product: Product
    var quantity: Int
    
    // TODO: Add computed property for subtotal
    var subtotal: Double {
        return product.price * Double(quantity)
    }
    
    // TODO: Add mutating method to update quantity
    mutating func updateQuantity(_ newQuantity: Int) {
        if newQuantity > 0 {
            self.quantity = newQuantity
        } else {
            print("Error: Quantity must be greater than 0.")
        }
    }
    // TODO: Add method to increase quantity
    mutating func increaseQuantity(by amount: Int) {
        if amount > 0 {
            self.quantity += amount
        }
        else {
            print("Error: Quantity must be greater than 0.")
        }
    }
}
