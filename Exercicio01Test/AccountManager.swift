//
//  AccountManager.swift
//  Exercicio01Test
//
//  Created by Paulo Henrique dos Santos on 02/03/16.
//  Copyright © 2016 Paulo Henrique dos Santos. All rights reserved.
//

import Foundation

class AccountManager {
    
    static let sharedInstance = AccountManager()
    let trainer = Trainer?
    
    func login(user:String, password:String) ->JsonReturn {
        if let url = NSURL(string: "http://server03.local:60080/login?user=\(user)&password=\(password)") {
            
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "GET"
            
            //request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
                guard error == nil && data != nil else {                                                          // check for fundamental networking error
                    print("error=\(error)")
                    return nil
                }
                
                if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(response)")
                    return nil
                }
                
                
                
                //PARSEANDO O JSON
                
                do {
                    let JSON = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions(rawValue: 0))
                    guard let JSONDictionary :NSDictionary = JSON as? NSDictionary else {
                        print("Not a Dictionary")
                        // put in function
                        return
                    }
                    print("JSONDictionary! \(JSONDictionary)")
                    print("login Ok")
                    
                    let teste = Trainer(json: JSONDictionary["data"] as! [String : AnyObject])
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
}
