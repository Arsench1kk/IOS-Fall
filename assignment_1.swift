//
//  Untitled.swift
//  assignment 1
//
//  Created by Арсен Абдухалық on 19.09.2025.
//

import UIKit

let firstname: String = "Arsen"
let lastname: String = "Abdukhalyk"
var age: Int = 19
let BirthYear: Int = 2005
var isStudent: Bool = true
var height: Double = 1.80
var weight: Double = 67.5
var isMarried: Bool = false
let currentYear: Int = 2025
age = currentYear - BirthYear

var hobby: [String] = ["Photography", "Bycicle Riding", "Watching Movies and Anime", "Music", "Physical Training", "Teaching", "Solving Tasks"]
var numberOfHobbies: Int = hobby.count
var favoviteNumber: Int = 17
var IsHobbyCreative: Bool = true

let SummaryOfMyLife: String = "My name is \(firstname) \(lastname). I am \(age) years old, born in \(BirthYear). I am currently a student.I am \(height) meters tall and weigh \(weight) kilograms. I am not married. I enjoy \(hobby[0]) and \(hobby[1]), and I also like \(hobby[2]) and \(hobby[3]), and I like to \(hobby[4]) and \(hobby[5]) as well, and I also like to \(hobby[6]) from time to time. I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favoviteNumber)"

print(SummaryOfMyLife)

var 👨🏻‍💻: String = "software developer"
var 🌎: String = "world"
var 👀: String = "see"
var futureGoals: String = "I hope to become a \(👨🏻‍💻) in the future, and to travel the \(🌎) and \(👀) as many different cultures as possible."

print(futureGoals)
