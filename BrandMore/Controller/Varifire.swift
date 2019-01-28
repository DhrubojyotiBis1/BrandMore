//
//  Varifire.swift
//  BrandMore
//
//  Created by Dhrubojyoti on 29/01/19.
//  Copyright © 2019 Dhrubojyoti. All rights reserved.
//

import UIKit

class Varifire: UIViewController,UITextFieldDelegate {

    @IBOutlet var outSide: UIView!
    @IBOutlet weak var changeMobileNumberButton: UIButton!
    @IBOutlet weak var varifireButton: UIButton!
    @IBOutlet weak var varifireWhiteBackground: UIView!
    @IBOutlet weak var varifyTextField: UITextField!
    override func viewWillAppear(_ animated: Bool) {
        makeRoundCorner()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //TODO: all delegate here:
        varifyTextField.delegate = self
        
        //TODO:gesture registration and creation here:
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedOutSide))
        outSide.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func varifyButtonPressed(_ sender: Any) {
        if(varifyTextField.text != ""){
            //TODO: varify the otp with firebase
            //TODO: if varification is sucessfull then perform segue to go to Home
            //TODO: if varification is sucessfull then show alart
        }
    }
    @IBAction func changeMobileNumberButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:- Function
    
    @objc func tappedOutSide(){
        varifyTextField.endEditing(true)
    }
    
    func makeRoundCorner(){
        changeMobileNumberButton.layer.cornerRadius = 10
        varifireButton.layer.cornerRadius = 10
        varifireWhiteBackground.layer.cornerRadius = 20
        
    }

}
