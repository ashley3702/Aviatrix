//
//  main.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//
import Foundation
func gauges(myPlane : Aviatrix) {
    print("Reading the gauges...")
    print(" ")
    //    print("| Running:  | :white_check_mark:")
        print("| Location:  | \(myPlane.location)")
    //    print("| Distance:  | \(myPlane.distanceTraveled) miles")
    //    print("| Fuel:      | \(myPlane.fuelLevel) gallons")
    //    print("| Max Fuel:  | \(myPlane.maxFuel) gallons")a
    //    print("| MPG:       | \(myPlane.milesPerGallon)")
    //    print("| Fuel Bill: | \(myPlane.fuelCost)")
}
func fly(myPlane : Aviatrix) {
    print("Where would you like to fly to? ")
    print(" ")
    let destinations = myPlane.knownDestinations()
    for (index, city) in destinations.enumerated() {
        let distance = myPlane.distanceTo(target: city, location:"")
        print("\(index): \(city), \(distance) miles")
    }
    let response = Int(readLine()!)
    var desiredLocation = ""
    if response! >= 0 && response! < 4 {
        desiredLocation = myPlane.knownDestinations()[response!]
        print(":airplane_departure: Preparing for takeoff...")
        print(":airplane_departure: Flying...")
        if fuelCheck(myPlane: myPlane, destination : desiredLocation) {
            myPlane.flyTo(destination: desiredLocation)
            print(":airplane_arriving: You've arrived in \(plane.location)!")
            gauges(myPlane: myPlane)
        }
    }
    else {
        print(":warning:Please enter a valid command:warning:")
    }
}
func refuel(myPlane : Aviatrix) {
    let refuelData = myPlane.refuel()
    print("Refueling...")
    print(":fuelpump: Here in _________, jet fuel costs _________")
    print(":fuelpump: You refueled _________ gallons totaling _________")
}
func fuelCheck(myPlane : Aviatrix, destination : String) -> Bool {
    //    let distanceToTravel =  Double(myPlane.distanceTo(target : destination))
    //    if myPlane.fuelLevel < distanceToTravel {
    //        print(" ")
    //        print(":fire: :fire: :fire: :fire: :fire: :fire: :fire: :fire: :fire: :fire:")
    //        print("Oh no! You've run out of fuel and crashed on the way to \(myPlane.location)!")
    //        print(":fire: :fire: :fire: :fire: :fire: :fire: :fire: :fire: :fire: :fire:")
    //
    //        return false
    //    } else {
    //        return true
    //    }
    return true
}
var plane = Aviatrix (authorName: "Ashley")
print("Welcome to the Aviatrix Flight System by \(plane.author)")
plane.start()
print("You're currently in \(plane.location)")
var command = ""
while command != "q" {
    print(" ")
    print("What would you like to do?")
    print("a) :bar_chart: check the plane gauges")
    print("b) :airplane_departure: fly to a different city")
    print("c) :fuelpump: refuel")
    print("q) :x: quit")
    print(" ")
    print("Action: ")
    command = readLine()!
    if command == "a" {
        gauges(myPlane: plane)
    }
    else if command == "b" {
        fly(myPlane: plane)
    }
    else if command == "c" {
        refuel(myPlane: plane)
    }
    else if command != "q" {
        print(":warning:Please enter a valid command:warning:")
    }
}
print(" ")
print("Thanks for flying with \(plane.author)'s airline!")
