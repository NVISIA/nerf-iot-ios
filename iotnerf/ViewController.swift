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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnFire(sender: AnyObject) {
        service.fire()
    }

}

