//
//  main.swift
//  StudentGrades
//
//  Created by Арсен Абдухалық on 25.09.2025.
//

import Foundation
print("Welcome to the Student Grades Program! \n to exit type 'exit' and '-1'")
print("Enter the Student name and their grades: \n example: \n John \n 85")
var StudentName: String = ""
var Grade: Double = 0
var GradeList: [Double] = []
var StudentList: [String] = []
repeat {
    StudentName = readLine()!
    Grade = Double(readLine()!)!
    GradeList.append(Grade)
    StudentList.append(StudentName)
} while (StudentName != "exit" && Grade != -1)

StudentList.remove(at: StudentList.count - 1)
GradeList.remove(at: GradeList.count - 1)

var average: Double = 0
var max: Double = 0
var min: Double = 100
for i in 0..<GradeList.count {
    average += GradeList[i]
    if (GradeList[i] > max) {
        max = GradeList[i]
    }
    if (GradeList[i] < min) {
        min = GradeList[i]
    }
}
average /= Double(GradeList.count)

print("The average grade is \(average) \n The highest grade is \(max) \n The lowest grade is \(min)")

for i in 0..<StudentList.count {
    print("\(StudentList[i]) has a grade of \(GradeList[i]) different from average \(GradeList[i] - average)")
}

