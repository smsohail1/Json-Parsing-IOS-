//
//  ViewController.swift
//  Rest Api JSON Parsing
//
//  Created by Abdul Ahad on 7/25/17.
//  Copyright © 2017 plash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load into Session
        let url = URL(string: "https://jsonplaceholder.typicode.com/users/1")!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        
                        //Implement your logic
                        print(json)
                        let company =  json["company"] as! [String:Any]
                        print(company["catchPhrase"] as! String)
                        
                        for item in company{
                            print("\(item.key),,,,\(item.value)")
                        }
                        
                        for (key,value) in company{
                            print("\(key),,\(value)")
                        }
                        
                        print(json["name"] as! String)
                        
                        
                        let address = json["address"] as! [String:Any]
                        
                        for item in address{
                           print("\(item.key) ,,,, \(item.value)")
                            //var k = item
                          //  var k:String! = item
                            if(item.key == "geo"){
                                let geoValue = address["geo"] as! [String:AnyObject]
                                for i in geoValue{
                                    print("\(i.key) ,,,,,,, \(i.value)")
                                }
                            }
                        }
                        
                       let geo = address["geo"] as! [String:AnyObject]
                        for item in geo{
                           print("\(item.key),\(item.value)")
                        }
                    }
                    
                }
                catch {
                    
                    print("error in JSONSerialization")
                    
                }
                
                
            }
            
        })
        task.resume()
        
        
        
    }

    
}

