//
//  File.swift
//  ShoppingCartSystem
//
//  Created by Арсен Абдухалық on 01.10.2025.
//

import Foundation

// TODO: Implement Address struct
struct Address {
    // TODO: Add properties
    var street: String
    var city: String
    var zipCode: String
    var country: String
    
    // TODO: Add computed property for formatted address
    var formattedAddress: String {
        // Return multi-line formatted address
        return "\(street), \(city), \(zipCode), \(country)"
    }
}
