//
//  main.swift
//  SimpleCalculator
//
//  Created by Арсен Абдухалық on 25.09.2025.
//

import Foundation

print("Welcome to Simple Calculator! \n Please enter your expression: \n For solution, type '=' \n For example: \n 3 \n + \n 5 \n =")

var number: Double = 0
var operation: String = ""
var numbers: [Double] = []
var operations: [String] = []

func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}

func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}

func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}

func divide(_ a: Double, _ b: Double) -> Double {
    return a / b
}

repeat {
    number = Double(readLine()!)!
    numbers.append(number)
    operation = readLine()!
    operations.append(operation)
} while operation != "="

operations.removeLast()

var i = 0

while i < operations.count  {
    
    switch operations[i] {
    case "*":
        let result = multiply(numbers[i], numbers[i+1])
        print("\(numbers[i]) * \(numbers[i+1]) = \(result)")
        numbers[i] = result
        operations.remove(at: i)
        numbers.remove(at: i+1)
        if i != 0 {i -= 1}
    case "/":
        if numbers[i+1] == 0 {
            print("Error! Division by zero!")
            exit(0)
        }
        let result2 = divide(numbers[i], numbers[i+1])
        print("\(numbers[i]) / \(numbers[i+1]) = \(result2)")
        numbers[i] = result2
        operations.remove(at: i)
        numbers.remove(at: i+1)
        if i != 0 {i -= 1}
    default:
        i += 1
    }
}

i = 0

while i < operations.count {
    
    switch operations[i] {
    case "+":
        let result3 = add(numbers[i], numbers[i+1])
        print("\(numbers[i]) + \(numbers[i+1]) = \(result3)")
        numbers[i] = result3
        operations.remove(at: i)
        numbers.remove(at: i+1)
        if i != 0 {i -= 1}
    case "-":
        let result5 = subtract(numbers[i], numbers[i+1])
        print("\(numbers[i]) - \(numbers[i+1]) = \(result5)")
        numbers[i] = result5
        operations.remove(at: i)
        numbers.remove(at: i+1)
        if i != 0 {i -= 1}
    default :
        i += 1
    }
}

print(numbers[0])
// 5 + 3 - 2 * 4 + 6 / 2
// 0 0 1 1 2 2 3 3 4 4 5
//5
//+
//3
//-
//2
//*
//4
//+
//6
///
//2

//5
//-
//2
///
//5
//+
//7
//*
//3
//*
//1.5
//-
//54
//=
