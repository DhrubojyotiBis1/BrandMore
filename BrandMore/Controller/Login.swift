//
//  Login.swift
//  BrandMore
//
//  Created by Dhrubojyoti on 27/01/19.
//  Copyright © 2019 Dhrubojyoti. All rights reserved.
//

import UIKit

class Login: UIViewController,UITextFieldDelegate {
    
    //MARK:- Global variable
    @IBOutlet var outSide: UIView!
    @IBOutlet weak var passwordTextView: UITextField!
    @IBOutlet weak var emailTextView: UITextField!
    @IBOutlet weak var createNewAccountButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var whiteBackground: UIView!
    
    //MARK:- Initial
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //TODO: Delegate here:
        passwordTextView.delegate = self
        emailTextView.delegate = self
        
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
    }
    
    
    
    //MARK:- Function
    @objc func tappedOutSide(){
        passwordTextView.endEditing(true)
        emailTextView.endEditing(true)
    }
    
    func makeRoundedCorner(){
        //Function that makes the corner of the button and the white background of the page round with a given radiuus
        createNewAccountButton.layer.cornerRadius = 10
        loginButton.layer.cornerRadius = 10
        whiteBackground.layer.cornerRadius = 20
    }
    
}
