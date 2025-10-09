//
//  File.swift
//  ShoppingCartSystem
//
//  Created by Арсен Абдухалық on 01.10.2025.
//

import Foundation

// TODO: Implement ShoppingCart class
class ShoppingCart {
    // TODO: Add properties
    private(set) var items: [CartItem]
    var discountCode: String?
    
    // TODO: Implement initializer
    init() {
        self.items = []
        self.discountCode = nil
    }
    
    // TODO: Add item to cart
    func addItem(product: Product, quantity: Int = 1) {
        // Check if product already exists in cart
        for i in 0..<items.count {
            // If yes: update quantity
            if items[i].product.id == product.id {
                items[i].increaseQuantity(by: quantity)
                return
            }
        }
        // If no: add new CartItem
        items.append(CartItem(product: product, quantity: quantity))
    }
    
    // TODO: Remove item from cart
    func removeItem(productId: String) {
        // Remove CartItem with matching product.id
        for i in 0..<items.count {
            if items[i].product.id == productId {
                items.remove(at : i)
                break
            }
        }
    }
    
    func viewItems() {
        for i in 0..<items.count {
            print("\(items[i].product.name): \(items[i].quantity)")
        }
    }
    
    // TODO: Update item quantity
    func updateItemQuantity(productId: String, quantity: Int) {
        // Find item and update quantity
        for i in 0..<items.count {
            if items[i].product.id == productId {
                // If quantity is 0, remove item
                if quantity == 0 {
                    items.remove(at: i)
                    break
                } else {
                    items[i].updateQuantity(quantity)
                    break
                }
            }
        }
    }
    
    // TODO: Clear all items
    func clearCart() {
        // Remove all items
        items.removeAll()
    }
    
    // TODO: Computed property for subtotal
    var subtotal: Double {
        // Sum all item subtotals
        var subtotal_local: Double = 0.0
        for i in 0..<items.count {
            subtotal_local += items[i].product.price * Double(items[i].quantity)
        }
        return subtotal_local
    }
    
    // TODO: Computed property for discount amount
    var discountAmount: Double {
        // Calculate discount based on discountCode
        // Example: "SAVE10" = 10% off, "SAVE20" = 20% off
        switch discountCode {
        case "SAVE10" :
            return subtotal * 0.10
        case "SAVE20" :
            return subtotal * 0.20
        default:
            return 0.0
        }
    }
    
    // TODO: Computed property for total
    var total: Double {
        // subtotal - discountAmount
        var total_local: Double = 0.0
        for i in 0..<items.count {
            total_local += items[i].subtotal
        }
        total_local -= discountAmount
        return total_local
        //items.reduce(0) { $0 + $1.subtotal }
    }
    
    // TODO: Computed property for item count
    var itemCount: Int {
        // Total number of individual items (sum of quantities)
        var total = 0
        for i in 0..<items.count {
            total += items[i].quantity
        }
        return total
        //items.reduce(0) { $0 + $1.quantity }
    }
    
    var uniqueItemCount: Int {
        items.count
    }
    
    // TODO: Check if cart is empty
    var isEmpty: Bool {
        // Return true if no items
        if items.count == 0 {
            return true
        } else {
            return false
        }
    }
}
