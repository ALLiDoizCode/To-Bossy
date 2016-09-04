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
        next.backgroundColor = MaterialColor.cyan.darken1
        
        myTitle.text = "To Bossy"
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

