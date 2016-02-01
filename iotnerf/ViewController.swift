//
//  ViewController.swift
//  iotnerf
//
//  Created by Justin Montgomery on 1/27/16.
//  Copyright © 2016 Nvisia. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    var service : NerfGunService = DefaultNerfGunService()
    
    let fireDelaySeconds = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnFire.enabled  = btnToggle.on
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        service.initialize()
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        service.dispose()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var btnFire: UIButton!
    @IBOutlet weak var btnToggle: UISwitch!
    
    @IBAction func btnFire(sender: AnyObject) {
        service.fire()
    }
    @IBAction func actionToggle(sender: UISwitch) {
        if(sender.on) {
            service.turnOn()
            NSTimer.scheduledTimerWithTimeInterval(fireDelaySeconds,
                target:self,selector:Selector("enableBtnFire"),
                userInfo:nil,
                repeats: false)

        }
        else {
            service.turnOff()
            print("Disabling fire button")
            btnFire.enabled = false
        }
    }
    
    @objc func enableBtnFire() {
        print("Enabling fire button")
        btnFire.enabled = true
    }

}

