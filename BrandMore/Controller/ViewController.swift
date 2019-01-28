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
    @IBOutlet weak var emailTextVlew: UITextField!
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
        let name = nameTextView.text!
        let password = passwordTextView.text!
        let conformPassword = conformPasswordTextView.text!
        let email = emailTextVlew.text!
        let pin = pinTextView.text!
        
        let rightPassword = checkPassword(password: password, conformPassword: conformPassword)
        if(rightPassword){
            storeData(name: name, password: password, email: email, pin: pin)
            sendDataToDataBase()
            goToHome()
        }else{
            print("Password didn't match")
            //TODO: show an alart that somethis is wrong
        }
        
    }
    
    
    
    //MARK:- Function:
    
    func checkPassword(password:String,conformPassword:String)->Bool{
        //check wether password and conformPassword is same or not
        if (password == conformPassword){
            return true
        }
        return false
    }
    func sendDataToDataBase(){
        //TODO: send the data to the remote database
    }
    
    func storeData(name:String,password:String,email:String,pin:String){
        //Function that store data to the local database
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        user.setValue(name, forKey: "name")
        user.setValue(password, forKey: "password")
        user.setValue(email, forKey: "email")
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
