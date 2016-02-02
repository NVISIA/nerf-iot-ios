//
//  NerfGunService.swift
//  iotnerf
//
//  Created by Justin Montgomery on 1/27/16.
//  Copyright © 2016 Nvisia. All rights reserved.
//

import Foundation

// Invoke nerf gun functionality
protocol NerfGunService {
    
    // Initialize the connections
    func initialize()
    
    // dispose of any resources 
    // can call "initialize" again to reinvoke functions
    func dispose()
    
    // Fire the gun
    func fire()
    
    // Turn on the gun
    func turnOn()
    
    // Turn off the gun
    func turnOff()
    
    // Stop firing the gun
    func stopFire()
    
    // change user name
    func changeName(name:String)
    
    // TODO: Add listener interface to receive socket callbacks
}