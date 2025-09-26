import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
for number in 1...100 {
    if number.isMultiple(of: 3) {
        print("Fizz")
    } else if number.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print("FizzBuzz")
    }
}

func isPrime(_ number: Int) -> Bool {
    var multiility = 0
    for i in 1...number {
        if number.isMultiple(of: i) {
            multiility += 1
            if multiility > 2 {
                return false
            }
        }
    }
        return true
    }

if isPrime(111) {
    print("Prime")
} else {
    print("Not Prime")
}
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
var temperature_type: String = ""
var temperature_value: Double = 0.0

print("Choose the temperature type: C, F, K")
if let InputType = readLine() {
    temperature_type = InputType.uppercased()
        print("temperature type: \(temperature_type)")
} else { print("Error") }

print("set the temperature value:")

if let input = readLine(), let value = Double(input) {
    temperature_value = value
    print("Input: \(temperature_value)")
} else {
    print("Error: Please enter a valid number") }

switch temperature_type {
case "C":
    print("F: ", (temperatureConverterFromCelsiusToFahrenheit(temperature_value), "K: ", (temperatureConverterFromCelsiusToKelvin(temperature_value))))
case "F":
    print("C: ", (temperatureConverterFromFahrenheitToCelsius(temperature_value)), "K: ",
    (temperatureConverterFromFahrenheitToKelvin(temperature_value)))
case "K":
    print("C: ", (temperatureConverterFromKelvinToCelsius(temperature_value)), "F: ", (temperatureConverterFromKelvinToFahrenheit(temperature_value)))
default:
    break
}
//switch temperature_type {
//case "C":
//    print("F: ", (temperature_value * 9/5) + 32, "K: ", (temperature_value + 273.15) )
//case "F":
//    print("C: ", (temperature_value - 32) * 5/9, "K: ",
//    (temperature_value - 32) * 5/9 + 273.15)
//case "K":
//    print("C: ", (temperature_value - 273.15), "F: ",
//    (temperature_value - 273.15) * 9/5 + 32 )
//default:
//    break
//}
