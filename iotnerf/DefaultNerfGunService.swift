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
    
    let fireOnEvent = "fire_on"
    let firedOffEvent = "fire_off"
    let connectionEvent = "connect"
    let nameChangeEvent = "name_changed"
    let spunUpEvent = "spun_up"
    let spunDownEvent = "spun_down"
    let userDisconnectedEvent = "user_disconnected"
    
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
            socket!.emit(fireOnEvent)
        }
    }
    
    func turnOn() {
        if(socket != nil) {
            print("Turning on...")
            socket!.emit(spunUpEvent)
        }
    }
    
    func turnOff() {
        if(socket != nil) {
            print("Turning off...")
            socket!.emit(spunDownEvent)
        }
    }
    
    func addHandlers() {
        self.socket!.on(fireOnEvent) { data, ack in
                print("Fire Event Received")
        }
        self.socket!.on(firedOffEvent) { data, ack in
            print("Fire off Event Received")
        }
        self.socket!.on(connectionEvent) { data, ack in
            print("Connection Event Received")
        }
        self.socket!.on(nameChangeEvent) { data, ack in
            print("NameChange Event Received")
        }
        self.socket!.on(spunUpEvent) { data, ack in
            print("Spun Up Event Received")
        }
        self.socket!.on(spunDownEvent) { data, ack in
            print("Spun Down Event Received")
        }
        self.socket!.on(userDisconnectedEvent) { data, ack in
            print("User Disconnected Event Received")
        }
    }
}
