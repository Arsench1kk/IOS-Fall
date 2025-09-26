//
//  main.swift
//  Fibonacci
//
//  Created by Арсен Абдухалық on 25.09.2025.
//

import Foundation
print("Enter a number:")
guard let n1: Int = readLine().flatMap(Int.init) else {
    print("Invalid input")
    exit(1)
}
func fibonacci(n1: Int){
    var arr: [Int] = []
    if n1 <= 0 {
        print("[]")
    } else {
        for i in 0..<n1{
            if i < 2 {
                arr.append(i)
            }
            else {
                arr.append(0)
                arr[i] = arr[i-1] + arr[i-2]
            }
        }
        for i in arr {
            print(i, terminator: " ")
        }
    }
}

fibonacci(n1: n1)
