//
//  main.swift
//  Shopping_List_Manager
//
//  Created by Арсен Абдухалық on 23.09.2025.
//

import Foundation

var Shopping_List: [String] = []
var exitCheck: Bool = false

print("Welcome to Store, what do you want to buy? \n Choose 'Add' to add a new item to your list, 'Show' to see your list, 'Remove' to remove an item from your list, 'Exit' to exit the program.")
func main(exitCheck: inout Bool) {
    repeat {
        print("Enter your choice:")
        guard let input = readLine()?.lowercased() else {
            print("Error")
            exit(1)
        }
        switch input {
        case "add":
            addItem()
        case "show":
            showList()
        case "remove":
            removeItem()
        case "exit":
            exitProgram(exitCheck: &exitCheck)
        default:
            print("Invalid choice, please try again.")
        }
    } while exitCheck == false
}

func addItem() {
    print("Enter item to add:")
    guard let newItem = readLine() else { return }
    Shopping_List.append(newItem)
}

func showList() {
    if Shopping_List.isEmpty {
        print("Your shopping list is empty")
    } else {
        print("Your shopping list:")
        for item in Shopping_List {
            print("- \(item)")
        }
    }
}

func removeItem() {
    print("Enter item to remove:")
    guard let removeItem = readLine() else { return }
    Shopping_List.removeAll(where: { $0 == removeItem })
}

func exitProgram(exitCheck: inout Bool) {
    exitCheck = true
}

main(exitCheck: &exitCheck)
