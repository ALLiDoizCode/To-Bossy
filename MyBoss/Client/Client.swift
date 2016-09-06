//
//  Client.swift
//  MyBoss
//
//  Created by Jonathan on 9/5/16.
//  Copyright © 2016 NerdHouse. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SwiftEventBus

class Client {
    
    static let sharedInstance = Client()
    
    let URL = "https://goodboss.herokuapp.com/Rating"
    
    func sendRate(Rate:Ratings){
        
        let params = [
        
            "company" : Rate.company,
            "email" : Rate.email,
            "humor" : Rate.humor,
            "inspirational" : Rate.inspiration,
            "integrity" : Rate.integrity,
            "optimism" : Rate.optimism,
            "supportive" : Rate.supportive
        
        ]
        
        Alamofire.request(.POST, URL, parameters: params as? [String : AnyObject])
            .validate()
        .responseJSON { (response) in
            
            let json = JSON(data: response.data!)
            
            print(json)
            
            SwiftEventBus.post("Rate")
        }
    }
}