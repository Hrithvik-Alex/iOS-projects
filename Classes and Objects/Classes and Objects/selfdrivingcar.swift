//
//  selfdrivingcar.swift
//  Classes and Objects
//
//  Created by Hrithvik  Alex on 2018-03-13.
//  Copyright © 2018 Hrithvik  Alex. All rights reserved.
//

import Foundation

class SelfDrivingCar : Car {
    var destination : String?
    
    override func drive() {
        super.drive()
        
        if let userSetDestination = destination {
        print("driving towards " + userSetDestination)
        }
    }
}
