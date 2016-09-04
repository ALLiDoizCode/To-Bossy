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
    
    var rateValueLabel: MaterialLabel! = MaterialLabel()
    var emojiRateView: EmojiRateView! = EmojiRateView()
    let ratingTexts = ["Very bad", "Bad", "Normal", "Good", "Very good", "Perfect"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emojiRateView.rateValueChangeCallback = {(rateValue: Float) -> Void in
            self.rateValueLabel.text = String(
                format: "%.2f / 5.0, %@",
                rateValue, self.ratingTexts[Int(rateValue)])
        }
        
        
        rateValueLabel.textAlignment = .Center
        //rateValueLabel.backgroundColor = UIColor.blueColor()
        
        self.view.addSubview(rateValueLabel)
        self.view.addSubview(emojiRateView)
        
        let views = [emojiRateView,rateValueLabel]
        
        constrain(views) { _views in
            
            let superView = _views[0].superview
            
            _views[0].center == (superView?.center)!
            _views[0].left == (superView?.left)! + 20
            _views[0].right == (superView?.right)! - 20
            _views[0].height == _views[0].width
            
            _views[1].centerX == (superView?.centerX)!
            _views[1].bottom == _views[0].top - 20
            _views[1].left == (superView?.left)! + 20
            _views[1].right == (superView?.right)! - 20
            _views[1].height == 50
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Actions
    
    @IBAction func showEyesChanged(sender: UISwitch) {
        emojiRateView.rateShowEyes = sender.on
    }
    
    @IBAction func makeRandomColorRange(sender: UIButton) {
        emojiRateView.rateColorRange = (newRandomColor(), newRandomColor())
    }
    
    @IBAction func rateLineWidthChanged(sender: UISlider) {
        emojiRateView.rateLineWidth = CGFloat(sender.value)
    }
    
    @IBAction func mouthWidthChanged(sender: UISlider) {
        emojiRateView.rateMouthWidth = CGFloat(sender.value)
    }
    
    @IBAction func lipWidthChanged(sender: UISlider) {
        emojiRateView.rateLipWidth = CGFloat(sender.value)
    }
    
    @IBAction func eyeWidthChanged(sender: UISlider) {
        emojiRateView.rateEyeWidth = CGFloat(sender.value)
    }
    
    private func newRandomColor() -> UIColor {
        return UIColor.init(hue: newRandomNumber(), saturation: newRandomNumber(), brightness: newRandomNumber(), alpha: newRandomNumber())
    }
    
    private func newRandomNumber() -> CGFloat {
        return CGFloat(Double(arc4random()) % 1000 / 1000)
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
