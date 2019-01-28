//
//  ViewController.swift
//  BrandMore
//
//  Created by Dhrubojyoti on 27/01/19.
//  Copyright © 2019 Dhrubojyoti. All rights reserved.
//

import UIKit
import CoreData

class CreateNewUser: UIViewController,UITextFieldDelegate {
    
    
    //MARK:- Global Variable:
    @IBOutlet var outSide: UIView!
    @IBOutlet weak var conformPasswordTextView: UITextField!
    @IBOutlet weak var passwordTextView: UITextField!
    @IBOutlet weak var pinTextView: UITextField!
    @IBOutlet weak var mobileNumberTextVlew: UITextField!
    @IBOutlet weak var nameTextView: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginWhiteBackground: UIView!
    @IBOutlet weak var createAcountButton: UIButton!
    //MARK:- Initial
    
    override func viewWillAppear(_ animated: Bool) {
        if(getData()){
            self.view.isHidden = true
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        if(getData()){
            goToHome()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //TODO: All delegate here:
        
        nameTextView.delegate = self
        mobileNumberTextVlew.delegate = self
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
        let name = nameTextView.text
        let mobileNumber = mobileNumberTextVlew.text
        let pin = pinTextView.text
        //TODO: check if the mobileNumber is integer of not the perform storedata
        if(mobileNumber != "" && name != "" && pin != ""){
            storeData(name: name!, mobileNumber: mobileNumber!, pin: pin!)
            //TODO: call the signIn function :
            //TODO: if signIn is sucessfull then call goToVarifire
        }
}
    
    
    
    //MARK:- Function:
    
    func signInUsingMobileNumber(){
        //TODO: Use firebase authentication mobile number signIn feature
    }
    
    func storeData(name:String,mobileNumber:String,pin:String){
        //Function that store data to the local database
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        user.setValue(name, forKey: "name")
        user.setValue(mobileNumber, forKey: "mobilenumber")
        user.setValue(pin, forKey: "pin")
        do{
            print("Saved")
            try context.save()
        }catch{
            print("error")
        }
    }
    func goToHome(){
        self.performSegue(withIdentifier: "goToHome", sender: self)
    }
    
    func goToVarifire(){
        self.performSegue(withIdentifier: "goToVarifire", sender: self)
    }
    
    func getData()->Bool{
        //Function that gets the data from the local database
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(request)
            if(results.count>0){
                return true
            }
        }catch{
            print("NotLogin")
        }
        
        return false
    }
    
    @objc func tappedOutSide(){
        //Function ends the edition of textView
        nameTextView.endEditing(true)
        mobileNumberTextVlew.endEditing(true)
        pinTextView.endEditing(true)
    }
    
    func makeRoundCorner(){
        //Function that makes the corner of the button and the white background of the page round with a given radiuus
        loginWhiteBackground.layer.cornerRadius = 20
        createAcountButton.layer.cornerRadius = 10
        loginButton.layer.cornerRadius = 10
    }
}
