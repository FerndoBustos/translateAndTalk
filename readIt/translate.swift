//
//  translate.swift
//  readIt
//
//  Created by Bustos Ramírez Luis Fernando on 01/09/16.
//  Copyright © 2016 Bustos Ramírez Luis Fernando. All rights reserved.
//

import Foundation


let urlPath: String = "YOUR_URL_HERE"

func sdsd(){
    let url: NSURL = NSURL(string: urlPath)!
    let request1: NSURLRequest = NSURLRequest(URL: url)
    let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
    
    
    do{
        
        let dataVal = try NSURLConnection.sendSynchronousRequest(request1, returningResponse: response)
        
        print(response)
        do {
            if let jsonResult = try NSJSONSerialization.JSONObjectWithData(dataVal, options: []) as? NSDictionary {
                print("Synchronous\(jsonResult)")
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        
        
    }catch let error as NSError
    {
        print(error.localizedDescription)
    }
}
