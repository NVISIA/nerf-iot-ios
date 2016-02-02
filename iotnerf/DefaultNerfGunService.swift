//
//  SocketIONerfGunService.swift
//  iotnerf
//
//  Created by Justin Montgomery on 1/27/16.
//  Copyright © 2016 Nvisia. All rights reserved.
//

import Foundation

class DefaultNerfGunService : NerfGunService {
    
    let host = "http://10.10.0.162:3000"
    
    var socket : SocketIOClient?
    
    init() {
    }
    
    func initialize() {
        let hostUrl = NSURL(string: host)!

        print("Opening socket to \(hostUrl)")
        self.socket = SocketIOClient(socketURL: hostUrl)
        self.addHandlers()
        self.socket!.connect()
    }
    
    func dispose() {
        self.socket?.disconnect()
        self.socket = nil
    }
    func fire() {
        if(socket != nil) {
            print("Invoking fire...")
            socket!.emit("fire_on")
        }
    }
    
    func turnOn() {
        if(socket != nil) {
            print("Turning on...")
            socket!.emit("spin_up")
        }
    }
    
    func turnOff() {
        if(socket != nil) {
            print("Turning off...")
            socket!.emit("spin_down")
        }
    }
    
    // Stop firing the gun
    func stopFire() {
        if(socket != nil) {
            print("Stopping fire...")
            socket!.emit("fire_off")
        }
    }
    
    // change user name
    func changeName(name:String) {
        if(socket != nil) {
            print("Changing name to \(name)")
            socket!.emit("name_change")
        }
    }
    
    
    func addHandlers() {
        self.socket!.on("fired_on") { data, ack in
                print("Fire Event Received")
        }
        self.socket!.on("fired_off") { data, ack in
            print("Fire off Event Received")
        }
        self.socket!.on("new_connection") { data, ack in
            print("Connection Event Received")
        }
        self.socket!.on("name_changed") { data, ack in
            print("NameChange Event Received")
        }
        self.socket!.on("spun_up") { data, ack in
            print("Spun Up Event Received")
        }
        self.socket!.on("spun_down") { data, ack in
            print("Spun Down Event Received")
        }
        self.socket!.on("user_disconnected") { data, ack in
            print("User Disconnected Event Received")
        }
    }
}
