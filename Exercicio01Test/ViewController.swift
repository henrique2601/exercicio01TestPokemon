//
//  ViewController.swift
//  Exercicio01Test
//
//  Created by Paulo Henrique dos Santos on 29/02/16.
//  Copyright © 2016 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }



    @IBAction func btnLoginTouch(sender: AnyObject) {
        
        if let url = NSURL(string: "http://server03.local:60080/login?user=\(txtUser.text!)&password=\(txtPassword.text!)") {
            
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "GET"
            let postString = "user=\(txtUser.text!)&password=\(txtPassword.text!)"
            print(postString)
            //request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
                guard error == nil && data != nil else {                                                          // check for fundamental networking error
                    print("error=\(error)")
                    return
                }
                
                if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(response)")
                }
                
                
                
                //PARSEANDO O JSON
                
                do {
                    let JSON = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions(rawValue: 0))
                    guard let JSONDictionary :NSDictionary = JSON as? NSDictionary else {
                        print("Not a Dictionary")
                        // put in function
                        return
                    }
                    //print("JSONDictionary! \(JSONDictionary)")
                    print("response")
                    
                    print(JSONDictionary["response"])
                    
                    let response = JSONDictionary["response"] as! String!
                    
                    if (response == "true") {
                        let teste = Trainer(json: JSONDictionary["data"] as! [String : AnyObject])
                        print(teste)
                    } else {
                        print(JSONDictionary["message"])
                    }
                    
                    
                    
                }
                catch let JSONError as NSError {
                    print("\(JSONError)")
                }
                
                
                
            }
            task.resume()
            
        } else {
            
            let alert = UIAlertController(title: "Alert", message: "invalid characters", preferredStyle: UIAlertControllerStyle.Alert)
            
            let OKAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alert.addAction(OKAction)
            
            self.presentViewController(alert , animated: true, completion: nil)
            
        }
        
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        
        return true
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        txtPassword.resignFirstResponder()
        txtUser.resignFirstResponder()
        
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print(__FUNCTION__)
        animateViewMoving(true, moveValue: 150)
    }
    func textFieldDidEndEditing(textField: UITextField) {
        print(__FUNCTION__) 
        animateViewMoving(false, moveValue: 150)
    }
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:NSTimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = CGRectOffset(self.view.frame, 0,  movement)
        UIView.commitAnimations()
    }
    
  

}

