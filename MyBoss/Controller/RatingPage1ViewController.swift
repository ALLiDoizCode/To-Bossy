//
//  RatingPage1ViewController.swift
//  MyBoss
//
//  Created by Jonathan on 9/4/16.
//  Copyright © 2016 NerdHouse. All rights reserved.
//

import UIKit
import TTGEmojiRate
import Material
import Cartography


class RatingPage1ViewController: UIViewController {
    
    var titleView:MaterialView = MaterialView()
    var myTitle:MaterialLabel = MaterialLabel()
    var rateValueLabel: MaterialLabel! = MaterialLabel()
    var emojiRateView: EmojiRateView! = EmojiRateView()
    var next:FlatButton = FlatButton()
    var back:FlatButton = FlatButton()
    
    var email:String!
    var company:String!
    var rate:Float!
    
    let ratingTexts = ["Very bad", "Bad", "Normal", "Good", "Very good", "Perfect"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //myTitle.backgroundColor = MaterialColor.brown.darken1
        
        self.rateValueLabel.text = "Slide My Face"
        
        emojiRateView.rateValueChangeCallback = {(rateValue: Float) -> Void in 

            
            self.rateValueLabel.text = self.ratingTexts[Int(rateValue)]
            self.rate = rateValue
        }
        
        next.setTitle("Next", forState: .Normal)
        next.backgroundColor = UIColor(red:0.11, green:0.79, blue:0.66, alpha:1.0)
        next.addTarget(self, action: #selector(RatingPage1ViewController.goToPage2), forControlEvents: .TouchUpInside)
        
        rateValueLabel.textAlignment = .Center
        
        myTitle.text = "How was work today?"
        myTitle.numberOfLines = 0
        myTitle.textColor = UIColor(red:0.11, green:0.79, blue:0.66, alpha:1.0)
        myTitle.textAlignment = .Center
        myTitle.font = RobotoFont.regularWithSize(48)
        
        back.setTitle("Back", forState: .Normal)
        back.setTitleColor(UIColor(red:0.11, green:0.79, blue:0.66, alpha:1.0), forState: .Normal)
        back.addTarget(self, action: #selector(RatingPage1ViewController.goBack), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(rateValueLabel)
        self.view.addSubview(emojiRateView)
        self.view.addSubview(next)
        self.view.addSubview(back)
        self.view.addSubview(titleView)
        self.titleView.addSubview(myTitle)
        
        let views = [emojiRateView,rateValueLabel,next,myTitle,back,titleView]
        
        constrain(views) { _views in
            
            let superView = _views[0].superview
            
            _views[0].center == (superView?.center)!
            _views[0].left == (superView?.left)! + 20
            _views[0].right == (superView?.right)! - 20
            _views[0].height == _views[0].width
            
            _views[1].bottom == _views[0].top - 20
            _views[1].left == (superView?.left)! + 20
            _views[1].right == (superView?.right)! - 20
            _views[1].height == 50
            
            _views[2].centerX == (superView?.centerX)!
            _views[2].bottom ==  (superView?.bottom)! - 50
            _views[2].left == (superView?.left)! + 50
            _views[2].right ==  (superView?.right)! - 50
            
            _views[3].center == (_views[3].superview?.center)!
            _views[3].width == 300
            _views[3].height == 130
            
            //backBtn
            _views[4].left == (superView?.left)!
            _views[4].top == (superView?.top)! + 20
            _views[4].width == 75
            _views[4].height == 30
            
            //titleView
            _views[5].size == superView!.size
            _views[5].center == (_views[5].superview?.center)!
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(0.75, delay: 2.5, options: .CurveEaseInOut, animations: { () -> Void in
            self.titleView.alpha = 0
            
            },
            completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func goToPage2(){
        
        self.performSegueWithIdentifier("Page2", sender: self)
    }
    
    func goBack(){
        
        self.performSegueWithIdentifier("Back", sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "Page2" {
            
            let controller = segue.destinationViewController as! RatingPage2ViewController
            
            controller.email = email
            controller.company = company
            controller.rate = rate
        }
    }
    

}
