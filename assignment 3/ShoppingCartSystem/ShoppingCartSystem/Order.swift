//
//  File.swift
//  ShoppingCartSystem
//
//  Created by Арсен Абдухалық on 01.10.2025.
//

import Foundation

// TODO: Implement Order struct
struct Order {
    // TODO: Add properties (all should be 'let')
    let orderId: UUID /*(generate UUID)*/
    let items: [CartItem] /*(copy from cart)*/
    let subtotal: Double
    let discountAmount: Double
    let total: Double
    let timestamp: Date
    let shippingAddress: Address
    
    // TODO: Implement initializer
    init(from cart: ShoppingCart, shippingAddress: Address) {
        // Create immutable snapshot of cart
        self.orderId = UUID() // Generate unique orderId
        self.items = cart.items // Copy all values from cart
        self.subtotal = cart.subtotal
        self.discountAmount = cart.discountAmount
        self.total = cart.total
        self.timestamp = Date() // Set timestamp to now
        self.shippingAddress = shippingAddress
    }
    
    // TODO: Add computed property
    var itemCount: Int {
        // Total number of items in order (sum of quantities)
        var total = 0
        for i in 0..<items.count {
            total += items[i].quantity
        }
        return total
        //items.reduce(0) { $0 + $1.quantity }
    }
    
    // Дополнительно: количество уникальных позиций
    var uniqueItemCount: Int {
        items.count
    }
}
