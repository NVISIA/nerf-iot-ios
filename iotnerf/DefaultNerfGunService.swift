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
    let fireCommand = "fire_on"
    var socket : SocketIOClient
    
    init() {
        let hostUrl = NSURL(fileURLWithPath:host)

        self.socket = SocketIOClient(socketURL: hostUrl)
        self.addHandlers()
        self.socket.connect()
    }
    func fire() {
        print("Invoking fire...")
        socket.emit(fireCommand)
    }
    
    func addHandlers() {
        self.socket.on(fireCommand) { data, ack in
                print("Fire Command Received!")
        }
    }
}
