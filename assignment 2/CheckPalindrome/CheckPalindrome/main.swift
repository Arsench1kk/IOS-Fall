//
//  main.swift
//  CheckPalindrome
//
//  Created by Арсен Абдухалық on 25.09.2025.
//

import Foundation

print("Welcome to the Check Palindrome Program! \n Enter a word or phrase to check if it is a palindrome:")
var input = readLine()!.lowercased()
input.removeAll(where: { $0 == " " })
func isPalindrome(_ input: String) -> Bool {
    var copy = input
    let size = copy.count
    
    for _ in 0..<size/2 {
        if copy.first != copy.last {
            return false
        }
        copy.removeFirst()
        copy.removeLast()
    }
    return true
}

if isPalindrome(input) {
    print("\(input) is a palindrome!")
} else {
    print("\(input) is not a palindrome.")
}
