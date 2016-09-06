//
//  Rating.swift
//  MyBoss
//
//  Created by Jonathan on 9/5/16.
//  Copyright © 2016 NerdHouse. All rights reserved.
//

import Foundation

class Ratings {
    
    var company:String!
    var email:String!
    var humor:Float!
    var inspiration:Float!
    var integrity:Float!
    var optimism:Float!
    var supportive:Float!
    
    init(company:String,email:String,humor:Float,inspiration:Float,integrity:Float,optimism:Float,supportive:Float){
        
        self.company = company
        self.email = email
        self.humor = humor
        self.inspiration = inspiration
        self.integrity = integrity
        self.optimism = optimism
        self.supportive = supportive
    }
}