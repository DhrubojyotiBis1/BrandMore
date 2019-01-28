//
//  Login.swift
//  BrandMore
//
//  Created by Dhrubojyoti on 27/01/19.
//  Copyright © 2019 Dhrubojyoti. All rights reserved.
//

import UIKit
import CoreData

class Login: UIViewController,UITextFieldDelegate {
    
    //MARK:- Global variable
    @IBOutlet var outSide: UIView!
    @IBOutlet weak var mobileNumberTextView: UITextField!
    @IBOutlet weak var createNewAccountButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var whiteBackground: UIView!
    
    //MARK:- Initial
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //TODO: Delegate here:
        mobileNumberTextView.delegate = self
        
        //TODO: gesture registration and creation here:
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedOutSide))
        outSide.addGestureRecognizer(tapGesture)
        
        //TODO: Function here:
        makeRoundedCorner()
    }
    
    
    
    //MARK:- Button
    @IBAction func createNewAccountButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        //TODO: perform the login action with data base
        //TODO: if login success the call goToVarifire Function
        goToVarifire()
    }
    
    
    
    //MARK:- Function
    
    func goToVarifire(){
        performSegue(withIdentifier: "goToVarifire", sender: self)
    }
    
    @objc func tappedOutSide(){
        mobileNumberTextView.endEditing(true)
    }    
    
    func makeRoundedCorner(){
        //Function that makes the corner of the button and the white background of the page round with a given radiuus
        createNewAccountButton.layer.cornerRadius = 10
        loginButton.layer.cornerRadius = 10
        whiteBackground.layer.cornerRadius = 20
    }
    
}
