//
//  PresentRating.swift
//  MyBoss
//
//  Created by Jonathan on 9/5/16.
//  Copyright © 2016 NerdHouse. All rights reserved.
//

import Foundation
import SwiftEventBus

class PresentRating {
    
    let client = Client.sharedInstance
    
    func sendRate(Rate:Ratings){
        
        SwiftEventBus.onBackgroundThread(self, name: "Rate") { (result) in
            
            SwiftEventBus.postToMainThread("Done")
        }
        
        client.sendRate(Rate)
    }
}