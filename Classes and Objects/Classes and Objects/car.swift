//
//  car.swift
//  Classes and Objects
//
//  Created by Hrithvik  Alex on 2018-03-13.
//  Copyright © 2018 Hrithvik  Alex. All rights reserved.
//

import Foundation

enum CarType {
    case Sedan
    case Coupe
    case Hatchback
}

class Car {
    var color = "Black"
    var numberOfSeats = 5
    var typeOfCar : CarType = .Coupe
    
    init() {
        
    }
    
    convenience init(chosenColor: String) {
        self.init()
        color = chosenColor
    }
    
    func drive() {
        print("Vroom!")
    }
}

