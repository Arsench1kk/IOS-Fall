//
//  File.swift
//  ShoppingCartSystem
//
//  Created by Арсен Абдухалық on 01.10.2025.
//

import Foundation
print("Hello! Please create an account to continue \n Enter your userid: ")
let userID: String = readLine()!
print("Enter your name: ")
let name: String = readLine()!
print("Enter your email: ")
let email: String = readLine()!
let user = User(userId: userID, name: name, email: email, orderHistory: [])


print("Welcome to the Shopping Cart System! \n Please enter your choice: \n 1. Add a product to the cart \n 2. View your cart \n 3. Remove an item from the cart \n 4. Update the quantity of an item \n 5. Checkout \n 6. Exit")
var choice: Int = 0
let cart = ShoppingCart()

repeat {
    if let line = readLine(), let parsed = Int(line) {
        choice = parsed
    } else {
        print("Please enter a valid number 1-6")
        continue
    }
    switch choice {
    case 1:
        print("Product ID: ")
        let productID: String = readLine() ?? ""
        print("Product name: ")
        let productName: String = readLine() ?? ""
        print("Product price: ")
        let productPrice: Double = Double(readLine() ?? "") ?? 0.0
        print("Product category: choices: 1. Electronics, 2. Clothing, 3. Food, 4. Books ")
        let productCategoryInput: Int = Int(readLine() ?? "") ?? 0
        let category: Product.Category
        switch productCategoryInput {
        case 1: category = .electronics
        case 2: category = .clothing
        case 3: category = .food
        case 4: category = .books
        default:
            print("Invalid category. Defaulting to 'books'.")
            category = .books
        }
        print("Product description: ")
        let productDescription: String = readLine() ?? ""
        print("Quantity: ")
        let quantity: Int = Int(readLine() ?? "") ?? 1
        
        let product = Product(id: productID, name: productName, price: productPrice, category: category, description: productDescription)
        cart.addItem(product: product, quantity: quantity)
        print("Added \(product.name) x\(quantity) to cart.")
        
    case 2:
        if cart.items.isEmpty {
            print("Your cart is empty.")
        } else {
            cart.viewItems()
            print("Subtotal: \(cart.subtotal)")
            if let code = cart.discountCode, !code.isEmpty {
                print("Discount (\(code)): -\(cart.discountAmount)")
            }
            print("Total: \(cart.total)")
        }
        
    case 3:
        if cart.items.isEmpty {
            print("Your cart is empty.")
            break
        }
        print("Choose the product to remove: ")
        for (i, item) in cart.items.enumerated() {
            print("\(i + 1). \(item.product.name)")
        }
        if let input = readLine(), let indexInput = Int(input) {
            let index: Int = indexInput - 1
            if cart.items.indices.contains(index) {
                let id = cart.items[index].product.id
                cart.removeItem(productId: id)
                print("Removed item.")
            } else {
                print("Invalid selection.")
            }
        } else {
            print("Invalid input.")
        }
        
    case 4:
        if cart.items.isEmpty {
            print("Your cart is empty.")
            break
        }
        print("Choose the product to update: ")
        for (i, item) in cart.items.enumerated() {
            print("\(i + 1). \(item.product.name). Current quantity: \(item.quantity)")
        }
        print("Type the id of the product:")
        let productId: String = readLine() ?? ""
        print("Type the new quantity (0 to remove):")
        let quantity: Int = Int(readLine() ?? "") ?? -1
        if quantity < 0 {
            print("Invalid quantity.")
        } else {
            cart.updateItemQuantity(productId: productId, quantity: quantity)
            print("Updated.")
        }
        
    case 5:
        print("Enter discount code (or press Enter to skip):")
        let code = readLine() ?? ""
        cart.discountCode = code.isEmpty ? nil : code
        print("Subtotal: \(cart.subtotal)")
        print("Discount: \(cart.discountAmount)")
        print("Total: \(cart.total)")
        
    case 6:
        print("Goodbye!")
        
    default:
        print("Please enter a valid number 1-6")
    }
} while choice != 6

//// TODO: Create test scenarios
//
//// 1. Create sample products
//let laptop = Product(id: "L001", name: "MacBook Pro 16", price: 2610565.00, category: .electronics, description: "M4 MAX, 48GB RAM, 1024GB SSD")
//let book = Product(id: "B001", name: "The Picture of Dorian Gray", price: 1499.99, category: .books, description: "Classic novel by Oscar Wilde")
//let headphones = Product(id: "H001", name: "AirPods Pro 2nd Gen", price: 129999.99, category: .electronics, description: "Wireless earbuds with active noise cancellation")
//
//// 2. Test adding items to cart
//let cart = ShoppingCart()
//cart.addItem(product: laptop, quantity: 1)
//cart.addItem(product: book, quantity: 2)
//
//// 3. Test adding same product twice (should update quantity)
//cart.addItem(product: laptop, quantity: 1)
//// Verify laptop quantity is now 2
//
//// Вывод количества для laptop
//if let laptopItem = cart.items.first(where: { $0.product.id == laptop.id }) {
//    print("quantity of \(laptop.name): \(laptopItem.quantity)")
//} else {
//    print("\(laptop.name) отсутствует в корзине")
//}
//
//// 4. Test cart calculations
//print("Subtotal: \(cart.subtotal)")
//print("Item count: \(cart.itemCount)")
//
//// 5. Test discount code
//cart.discountCode = "SAVE10"
//print("Total with discount: \(cart.total)")
//
//// 6. Test removing items
//cart.removeItem(productId: book.id)
//
//// 7. Demonstrate REFERENCE TYPE behavior
//func modifyCart(_ cart: ShoppingCart) {
//    cart.addItem(product: headphones, quantity: 1)
//}
//modifyCart(cart)
//// Verify original cart was modified
//if let headphonesInCart = cart.items.first(where: { $0.product.id == headphones.id }) {
//    print("Headphones in cart: quantity \(headphonesInCart.quantity)")
//} else {
//    print("Headphones in cart: nonу")
//}
//// 8. Demonstrate VALUE TYPE behavior
//let item1 = CartItem(product: laptop, quantity: 1)
//var item2 = item1
//item2.updateQuantity(5)
//// Verify item1.quantity is still 1 (not affected)
//print(item1.quantity)
//// 9. Create order from cart
//let address = Address(street: "Islam Karimova 70k3", city: "Almaty", zipCode: "00050", country: "Kazakhstan" )
//let order = Order(from: cart, shippingAddress: address)
//
//// 10. Modify cart after order creation
//cart.clearCart()
//// Verify order still contains original items (immutable snapshot)
//
//print("Order items count: \(order.itemCount)") // Should not be 0
//print("Cart items count: \(cart.itemCount)")   // Should be 0

