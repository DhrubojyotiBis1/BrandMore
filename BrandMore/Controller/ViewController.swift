//
//  ViewController.swift
//  BrandMore
//
//  Created by Dhrubojyoti on 27/01/19.
//  Copyright © 2019 Dhrubojyoti. All rights reserved.
//

import UIKit

class LogIn: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginWhiteBackground: UIView!
    @IBOutlet weak var createAcountButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        makeRoundCorner()
    }
    
    
    func makeRoundCorner(){
    //Function that makes the corner of the button and the white background of the page round with a given radiuus
    loginWhiteBackground.layer.cornerRadius = 20
    createAcountButton.layer.cornerRadius = 10
    loginButton.layer.cornerRadius = 10
    }
}

