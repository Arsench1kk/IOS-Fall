//
//  main.swift
//  TemperatureConventor
//
//  Created by Арсен Абдухалық on 23.09.2025.
//

import Foundation

func temperatureConverterFromCelsiusToFahrenheit(_ celsius: Double) -> Double {
    return (celsius * 9/5) + 32
}
func temperatureConverterFromFahrenheitToCelsius(_ fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5/9
}
func temperatureConverterFromCelsiusToKelvin(_ celsius: Double) -> Double {
    return celsius + 273.15
}
func temperatureConverterFromKelvinToCelsius(_ kelvin: Double) -> Double {
    return kelvin - 273.15
}
func temperatureConverterFromFahrenheitToKelvin(_ fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5/9 + 273.15
}
func temperatureConverterFromKelvinToFahrenheit(_ kelvin: Double) -> Double {
    return (kelvin - 273.15) * 9/5 + 32
}

print("Choose the temperature type: C, F, K")
guard let temperature_type = readLine()?.uppercased() else {
    print("Error reading input")
    exit(1)
}

print("temperature type: \(temperature_type)")

print("set the temperature value:")
guard let input = readLine(), let temperature_value = Double(input) else {
    print("Error: Please enter a valid number")
    exit(1)
}

print("Input: \(temperature_value)")

switch temperature_type {
case "C":
    let f = temperatureConverterFromCelsiusToFahrenheit(temperature_value)
    let k = temperatureConverterFromCelsiusToKelvin(temperature_value)
    print("F: \(f), K: \(k)")
case "F":
    let c = temperatureConverterFromFahrenheitToCelsius(temperature_value)
    let k = temperatureConverterFromFahrenheitToKelvin(temperature_value)
    print("C: \(c), K: \(k)")
case "K":
    let c = temperatureConverterFromKelvinToCelsius(temperature_value)
    let f = temperatureConverterFromKelvinToFahrenheit(temperature_value)
    print("C: \(c), F: \(f)")
default:
    print("Invalid temperature type")
}
