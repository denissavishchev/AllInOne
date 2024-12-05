//
//  ViewModel.swift
//  test
//
//  Created by Devis on 05/12/2024.
//

import SwiftUI

class CarViewModel: ObservableObject{
    @Published var cars: [Car] = []
    
    init(){
        getCars()
    }
    
    func getCars(){
        cars = carsData
    }
    
    func addCar() {
        cars.insert(Car(name: "Toyota", condition: "Old", color: "Brown"), at: cars.count)
    }
    
    func removeCar(){
        cars.removeFirst()
    }
}

let carsData = [
    Car(name: "Tesla", condition: "New", color: "Red"),
    Car(name: "Bentley", condition: "Old", color: "Blue"),
    Car(name: "Aston Martin", condition: "Old", color: "Green"),
    Car(name: "Audi", condition: "New", color: "yellow"),
    Car(name: "Masserati", condition: "New", color: "Orange"),
]
