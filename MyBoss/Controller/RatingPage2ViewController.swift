//
//  RatingPage2ViewController.swift
//  MyBoss
//
//  Created by Jonathan on 9/4/16.
//  Copyright © 2016 NerdHouse. All rights reserved.
//

import UIKit
import Material
import Cartography
import Cosmos

class RatingPage2ViewController: UIViewController {
    
    var humor:MaterialLabel = MaterialLabel()
    var inspirational:MaterialLabel = MaterialLabel()
    var supportive:MaterialLabel = MaterialLabel()
    var optimism:MaterialLabel = MaterialLabel()
    var integrity:MaterialLabel = MaterialLabel()
    
    var cosmosViewPrecise:CosmosView = CosmosView()
    
    var ratingSlider: UISlider!
    weak var ratingLabel: UILabel!
    let startRating:Float = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cosmosViewPrecise.rating = 0
        cosmosViewPrecise.settings.fillMode = .Precise
        cosmosViewPrecise.settings.starSize = 30
        cosmosViewPrecise.settings.filledColor = MaterialColor.cyan.darken1
        
        // Register touch handlers
        cosmosViewPrecise.didTouchCosmos = didTouchCosmos
        
        cosmosViewPrecise.didFinishTouchingCosmos = didFinishTouchingCosmos
        
        self.view.addSubview(humor)
        self.view.addSubview(inspirational)
        self.view.addSubview(supportive)
        self.view.addSubview(optimism)
        self.view.addSubview(integrity)
        self.view.addSubview(cosmosViewPrecise)
        
        let views = [humor,inspirational,supportive,optimism,integrity,cosmosViewPrecise]
        
        constrain(views) { _views in
            
            let superview = _views[0].superview
            
            _views[5].center == (superview?.center)!
            //_views[5].width == 300
            _views[5].height == 100
        }

        // Do any additional setup after loading the view.
    }
    
    private class func formatValue(value: Double) -> String {
        return String(format: "%.2f", value)
    }
    
    private func didTouchCosmos(rating: Double) {
        //ratingSlider.value = Float(rating)
        //ratingLabel.text = RatingPage2ViewController.formatValue(rating)
        //ratingLabel.textColor = UIColor(red: 133/255, green: 116/255, blue: 154/255, alpha: 1)
    }
    
    private func didFinishTouchingCosmos(rating: Double) {
        //ratingSlider.value = Float(rating)
        //self.ratingLabel.text = RatingPage2ViewController.formatValue(rating)
        //ratingLabel.textColor = UIColor(red: 183/255, green: 186/255, blue: 204/255, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
