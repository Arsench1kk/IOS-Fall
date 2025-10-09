//
//  File.swift
//  ShoppingCartSystem
//
//  Created by Арсен Абдухалық on 01.10.2025.
//

import Foundation

// TODO: Implement User class
class User {
    let userId: String
    let name: String
    let email: String
    private(set) var orderHistory: [Order]
    
    init(userId: String, name: String, email: String, orderHistory: [Order]) {
        self.userId = userId
        self.name = name
        self.email = email
        self.orderHistory = orderHistory
    }
    // Add method to place order
    func placeOrder(_ order: Order) {
        // Add order to history
        orderHistory.append(order)
    }
    
    // Computed property for total spent
    var totalSpent: Double {
        // Sum all order totals
        var user_total_spent_money = 0.0
        for i in 0..<orderHistory.count {
            user_total_spent_money += orderHistory[i].total
        }
        return user_total_spent_money
    }
}
