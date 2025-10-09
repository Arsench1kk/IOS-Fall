//
//  main.swift
//  ShoppingCartSystem
//
//  Created by Арсен Абдухалық on 01.10.2025.
//

import Foundation

// TODO: Implement Product struct
struct Product {
    // TODO: Add properties
    let id: String
    var name: String
    var price: Double
    var category: Category
    var description: String
    
    // TODO: Define Category enum
    enum Category: String {
        // Add cases:
        case electronics
        case clothing
        case food
        case books
    }
    
    // TODO: Add computed property
    var displayPrice: String {
        return String(format: "%.2f ₸", price)
    }
    
    // TODO: Add initializer with validation
    init(id: String, name: String, price: Double, category: Category, description: String) {
        self.id = id
        self.name = name
        self.category = category
        self.description = description
        
        if price <= 0 {
            self.price = 1.0
            print("Warning: Price must be greater than 0. Setting price to 1.0")
        } else {
            self.price = price
        }
    }
}
