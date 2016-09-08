//
//  ViewController.swift
//  MyBoss
//
//  Created by Jonathan on 9/4/16.
//  Copyright © 2016 NerdHouse. All rights reserved.
//

import UIKit
import Material
import Cartography

class ViewController: UIViewController {
    
    var myTitle:MaterialLabel = MaterialLabel()
    var email:TextField = TextField()
    var company:TextField = TextField()
    var next:FlatButton = FlatButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        email.placeholder = "Boss's Email"
        email.textAlignment = .Center
        
        company.placeholder = "Company Name"
        company.textAlignment = .Center
        
        next.setTitle("Next", forState: .Normal)
        next.backgroundColor = UIColor(red:0.11, green:0.79, blue:0.66, alpha:1.0)
        next.addTarget(self, action: #selector(ViewController.goToPage1), forControlEvents: .TouchUpInside)
        
        myTitle.text = "Good Boss"
        myTitle.font = RobotoFont.boldWithSize(32)
        myTitle.textAlignment = .Center
        
        self.view.addSubview(email)
        self.view.addSubview(company)
        self.view.addSubview(next)
        self.view.addSubview(myTitle)
        
        let views = [myTitle,email,company,next]
        
        
        constrain(views) { _views in
            
            let superView = _views[0].superview
            
            _views[0].centerX == (superView?.centerX)!
            _views[0].top == (superView?.top)! + 150
            _views[0].left == (superView?.left)! + 50
            _views[0].right ==  (superView?.right)! - 50

            
            _views[1].center == (superView?.center)!
            //_views[1].top == (superView?.top)! + 200
            _views[1].left == (superView?.left)! + 50
            _views[1].right ==  (superView?.right)! - 50
            
            _views[2].centerX == (superView?.centerX)!
            _views[2].top ==  _views[1].bottom + 50
            _views[2].left == (superView?.left)! + 50
            _views[2].right ==  (superView?.right)! - 50
            
            _views[3].centerX == (superView?.centerX)!
            _views[3].bottom ==  (superView?.bottom)! - 100
            _views[3].left == (superView?.left)! + 50
            _views[3].right ==  (superView?.right)! - 50
        }
        
    }
    
    func goToPage1(){
        
        guard email.text != "" else {
            
            print("we your bosses email")
            
            return
        }
        
        guard company.text != "" else {
            
            print("we need the name of the company you work for")
            
            return
        }
        
        self.performSegueWithIdentifier("Page1", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let controller = segue.destinationViewController as! RatingPage1ViewController
        
        controller.email = email.text
        controller.company = company.text
    }
}

