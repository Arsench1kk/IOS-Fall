//
//  main.swift
//  WordFrewuencyCounter
//
//  Created by Арсен Абдухалық on 25.09.2025.
//

import Foundation

var sentence: String = ""

print("Enter a sentence:")

guard let sentence = readLine()?.lowercased() else {
    print("Error")
    exit(1)
}
let words = sentence.split(separator: " ")
var wordCount: [String: Int] = [:]

for word in words {
    wordCount[String(word), default: 0] += 1
}

for (word, count) in wordCount {
    print("\(word): \(count)")
}
