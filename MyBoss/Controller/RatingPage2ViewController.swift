//
//  RatingPage2ViewController.swift
//  MyBoss
//
//  Created by Jonathan on 9/4/16.
//  Copyright © 2016 NerdHouse. All rights reserved.
//

import UIKit
import Material
import ChameleonFramework
import Cartography
import Cosmos
import MessageUI
import SwiftEventBus

class RatingPage2ViewController: UIViewController,MFMailComposeViewControllerDelegate {
    
    var humor:MaterialLabel = MaterialLabel()
    var inspirational:MaterialLabel = MaterialLabel()
    var supportive:MaterialLabel = MaterialLabel()
    var optimism:MaterialLabel = MaterialLabel()
    var integrity:MaterialLabel = MaterialLabel()
    var back:FlatButton = FlatButton()
    
    var cosmosHumor:CosmosView = CosmosView()
    var cosmosInspirational:CosmosView = CosmosView()
    var cosmosSupportive:CosmosView = CosmosView()
    var cosmosOptimism:CosmosView = CosmosView()
    var cosmosIntegrity:CosmosView = CosmosView()
    
    let presenter = PresentRating()
    
    var ratingSlider: UISlider!
    weak var ratingLabel: UILabel!
    let startRating:Float = 0
    
    var email:String!
    var company:String!
    var rate:Float!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sendEmail()
        
        cosmosHumor.rating = 0
        cosmosHumor.settings.fillMode = .Precise
        cosmosHumor.settings.starSize = 30
        cosmosHumor.settings.filledColor = MaterialColor.cyan.darken1
        //cosmosHumor.settings.emptyColor = UIColor(complementaryFlatColorOf: MaterialColor.cyan.darken1, withAlpha: 1)
        cosmosHumor.settings.filledBorderColor = UIColor(complementaryFlatColorOf: MaterialColor.cyan.darken1, withAlpha: 1)
        cosmosHumor.settings.emptyBorderColor = MaterialColor.cyan.darken1
        
        // Register touch handlers
        cosmosHumor.didTouchCosmos = didTouchCosmos
        cosmosHumor.didFinishTouchingCosmos = didFinishTouchingCosmos
        self.view.addSubview(cosmosHumor)
        
        cosmosInspirational.rating = 0
        cosmosInspirational.settings.fillMode = .Precise
        cosmosInspirational.settings.starSize = 30
        cosmosInspirational.settings.filledColor = MaterialColor.cyan.darken1
        //cosmosInspirational.settings.emptyColor = UIColor(complementaryFlatColorOf: MaterialColor.cyan.darken1, withAlpha: 1)
        cosmosInspirational.settings.filledBorderColor = UIColor(complementaryFlatColorOf: MaterialColor.cyan.darken1, withAlpha: 1)
        cosmosInspirational.settings.emptyBorderColor = MaterialColor.cyan.darken1
        
        // Register touch handlers
        cosmosInspirational.didTouchCosmos = didTouchCosmos
        cosmosInspirational.didFinishTouchingCosmos = didFinishTouchingCosmos
        self.view.addSubview(cosmosInspirational)
        
        cosmosSupportive.rating = 0
        cosmosSupportive.settings.fillMode = .Precise
        cosmosSupportive.settings.starSize = 30
        cosmosSupportive.settings.filledColor = MaterialColor.cyan.darken1
        //cosmosSupportive.settings.emptyColor = UIColor(complementaryFlatColorOf: MaterialColor.cyan.darken1, withAlpha: 1)
        cosmosSupportive.settings.filledBorderColor = UIColor(complementaryFlatColorOf: MaterialColor.cyan.darken1, withAlpha: 1)
        cosmosSupportive.settings.emptyBorderColor = MaterialColor.cyan.darken1
        
        // Register touch handlers
        cosmosSupportive.didTouchCosmos = didTouchCosmos
        cosmosSupportive.didFinishTouchingCosmos = didFinishTouchingCosmos
        self.view.addSubview(cosmosSupportive)
        
        cosmosOptimism.rating = 0
        cosmosOptimism.settings.fillMode = .Precise
        cosmosOptimism.settings.starSize = 30
        cosmosOptimism.settings.filledColor = MaterialColor.cyan.darken1
        //cosmosOptimism.settings.emptyColor = UIColor(complementaryFlatColorOf: MaterialColor.cyan.darken1, withAlpha: 1)
        cosmosOptimism.settings.filledBorderColor = UIColor(complementaryFlatColorOf: MaterialColor.cyan.darken1, withAlpha: 1)
        cosmosOptimism.settings.emptyBorderColor = MaterialColor.cyan.darken1
        
        // Register touch handlers
        cosmosOptimism.didTouchCosmos = didTouchCosmos
        cosmosOptimism.didFinishTouchingCosmos = didFinishTouchingCosmos
        self.view.addSubview(cosmosOptimism)
        
        cosmosIntegrity.rating = 0
        cosmosIntegrity.settings.fillMode = .Precise
        cosmosIntegrity.settings.starSize = 30
        cosmosIntegrity.settings.filledColor = MaterialColor.cyan.darken1
        //cosmosIntegrity.settings.emptyColor = UIColor(complementaryFlatColorOf: MaterialColor.cyan.darken1, withAlpha: 1)
        cosmosIntegrity.settings.filledBorderColor = UIColor(complementaryFlatColorOf: MaterialColor.cyan.darken1, withAlpha: 1)
        cosmosIntegrity.settings.emptyBorderColor = MaterialColor.cyan.darken1
        
        // Register touch handlers
        cosmosIntegrity.didTouchCosmos = didTouchCosmos
        cosmosIntegrity.didFinishTouchingCosmos = didFinishTouchingCosmos

        self.view.addSubview(cosmosIntegrity)
        
        
        humor.text = "Humor"
        humor.textAlignment = .Center
        humor.font = RobotoFont.mediumWithSize(24)
        
        inspirational.text = "Inspirational"
        inspirational.textAlignment = .Center
        inspirational.font = RobotoFont.mediumWithSize(24)
        
        supportive.text = "Supportive"
        supportive.textAlignment = .Center
        supportive.font = RobotoFont.mediumWithSize(24)
        
        optimism.text = "Optimism"
        optimism.textAlignment = .Center
        optimism.font = RobotoFont.mediumWithSize(24)
        
        integrity.text = "Integrity"
        integrity.textAlignment = .Center
        integrity.font = RobotoFont.mediumWithSize(24)
        
        back.setTitle("Back", forState: .Normal)
        back.setTitleColor(MaterialColor.cyan.darken1, forState: .Normal)
        back.addTarget(self, action: #selector(RatingPage1ViewController.goBack), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(humor)
        self.view.addSubview(inspirational)
        self.view.addSubview(supportive)
        self.view.addSubview(optimism)
        self.view.addSubview(integrity)
        self.view.addSubview(back)
        
        let views = [humor,inspirational,supportive,optimism,integrity,cosmosHumor,cosmosInspirational,cosmosSupportive,cosmosOptimism,cosmosIntegrity,back]
        
        constrain(views) { _views in
            
            let superview = _views[0].superview
            
            _views[0].left == (superview!.left) + 20
            _views[0].right == (superview!.right) - 20
            _views[0].top == (superview?.top)! + 50
            _views[0].height == 30
            
            _views[1].left == (superview!.left) + 20
            _views[1].right == (superview!.right) - 20
            _views[1].top ==  _views[0].bottom + 75
            _views[1].height == 30
            
            _views[2].left == (superview!.left) + 20
            _views[2].right == (superview!.right) - 20
            _views[2].top ==  _views[1].bottom + 75
            _views[2].height == 30
            
            _views[3].left == (superview!.left) + 20
            _views[3].right == (superview!.right) - 20
            _views[3].top ==  _views[2].bottom + 75
            _views[3].height == 30
            
            _views[4].left == (superview!.left) + 20
            _views[4].right == (superview!.right) - 20
            _views[4].top ==  _views[3].bottom + 75
            _views[4].height == 30
            
            //stars
            _views[5].center == (superview?.center)!
            _views[5].top == _views[0].bottom + 25
            //_views[5].width == 300
            //_views[5].height == 100
            
            _views[6].centerX == (superview?.centerX)!
            _views[6].top == _views[1].bottom + 25
            //_views[6].width == 300
            //_views[6].height == 100
            
            _views[7].centerX == (superview?.centerX)!
            _views[7].top == _views[2].bottom + 25
            //_views[6].width == 300
            //_views[6].height == 100
            
            _views[8].centerX == (superview?.centerX)!
            _views[8].top == _views[3].bottom + 25
            //_views[6].width == 300
            //_views[6].height == 100
            
            _views[9].centerX == (superview?.centerX)!
            _views[9].top == _views[4].bottom + 25
           // _views[6].width == 300
            //_views[6].height == 100
            
            //backBtn
            _views[10].left == (superview?.left)!
            _views[10].top == (superview?.top)! + 20
            _views[10].width == 75
            _views[10].height == 30
            
            
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
        
        var count = 0
        
        let stars = [cosmosHumor,cosmosInspirational,cosmosSupportive,cosmosOptimism,cosmosIntegrity]
        
        for star in stars {
            
            if star.rating != 0 {
                
                count = count + 1
            }
            
            if count == 5 {
                
                let myRating = Ratings(company: company, email: email, humor: Float(cosmosHumor.rating), inspiration: Float(cosmosInspirational.rating), integrity: Float(cosmosIntegrity.rating), optimism: Float(cosmosOptimism.rating), supportive: Float(cosmosSupportive.rating))
                
                SwiftEventBus.onMainThread(self, name: "Done", handler: { (result) in
                    
                    self.performSegueWithIdentifier("Home", sender: self)
                })
                
                self.presenter.sendRate(myRating)
                
                print("Done")
            }
        }
        //ratingSlider.value = Float(rating)
        //self.ratingLabel.text = RatingPage2ViewController.formatValue(rating)
        //ratingLabel.textColor = UIColor(red: 183/255, green: 186/255, blue: 204/255, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goBack(){
        
        self.performSegueWithIdentifier("Back", sender: self)
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["dev.jonathan.green@gmail.com"])
            mail.setMessageBody("<body><img src=\"http://www.w3schools.com/html/html5.gif\" alt=\"HTML5 Icon\" style=\"width:128px;height:128px;\"></body>", isHTML: true)
            
            presentViewController(mail, animated: true, completion: nil)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "Back" {
            
            let controller = segue.destinationViewController as! RatingPage1ViewController
            
            controller.email = email
            controller.company = company
        }
    }
    

}
