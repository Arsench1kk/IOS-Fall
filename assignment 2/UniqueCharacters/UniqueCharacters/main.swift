//
//  main.swift
//  UniqueCharacters
//
//  Created by Арсен Абдухалық on 26.09.2025.
//

import Foundation

print("Write a sentence to check if it has unique characters:")

var sentence: String = ""
sentence = readLine()!
sentence.removeAll(where: { $0 == " " })
func IsUniqueCharacters(_ string: String) -> Bool {
    for i in 0..<string.count {
        for j in i+1..<string.count {
            if string[string.index(string.startIndex, offsetBy: i)] == string[string.index(string.startIndex, offsetBy: j)] {
                return false
            }
        }
    }
    return true
}

if IsUniqueCharacters(sentence) {
    print("YES")
} else {
    print("NO")
}


