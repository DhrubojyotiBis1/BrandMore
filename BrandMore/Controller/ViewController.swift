//
//  ViewController.swift
//  BrandMore
//
//  Created by Dhrubojyoti on 27/01/19.
//  Copyright © 2019 Dhrubojyoti. All rights reserved.
//

import UIKit

class CreateNewUser: UIViewController,UITextFieldDelegate {


    //MARK:- Global Variable:
    @IBOutlet var outSide: UIView!
    @IBOutlet weak var conformPasswordTextView: UITextField!
    @IBOutlet weak var passwordTextView: UITextField!
    @IBOutlet weak var pinTextView: UITextField!
    @IBOutlet weak var emailTextVlew: UITextField!
    @IBOutlet weak var nameTextView: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginWhiteBackground: UIView!
    @IBOutlet weak var createAcountButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //MARK:- Initial
        //TODO: All delegate here:
        
        conformPasswordTextView.delegate = self
        passwordTextView.delegate = self
        nameTextView.delegate = self
        emailTextVlew.delegate = self
        pinTextView.delegate = self
        
        //TODO:gesture registration and creation here:
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedOutSide))
        outSide.addGestureRecognizer(tapGesture)
        
        
        
        //TODO: Function here:
        makeRoundCorner()
    }
    
    
    //MARK:- Buttons:
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToLogin", sender: sender)
    }
    
    
    @IBAction func createNewAccountButtonPressed(_ sender: Any) {
    }
    
    
    
    //MARK:- Function:
    @objc func tappedOutSide(){
        conformPasswordTextView.endEditing(true)
        passwordTextView.endEditing(true)
        nameTextView.endEditing(true)
        emailTextVlew.endEditing(true)
        pinTextView.endEditing(true)
    }
    
    func makeRoundCorner(){
    //Function that makes the corner of the button and the white background of the page round with a given radiuus
    loginWhiteBackground.layer.cornerRadius = 20
    createAcountButton.layer.cornerRadius = 10
    loginButton.layer.cornerRadius = 10
    }
}

