//
//  ViewController.swift
//  CoreMotionTest
//
//  Created by Vladimir Saprykin on 29.06.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let manager = CMMotionManager()

    @IBOutlet weak var myLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if manager.deviceMotionAvailable {
            
            manager.deviceMotionUpdateInterval = 0.1
            manager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (data: CMDeviceMotion?, error: NSError?) in
                
                if data?.userAcceleration.x < -1 {
                    self.view.backgroundColor = UIColor.redColor()
                    self.myLabel.text = "red"
                } else if data?.userAcceleration.x > 1 {
                    self.view.backgroundColor = UIColor.greenColor()
                    self.myLabel.text = "green"
                        
                    
                }
                
                
                
                
                 } )
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

