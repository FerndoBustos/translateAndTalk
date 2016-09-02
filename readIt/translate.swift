//
//  translate.swift
//  readIt
//
//  Created by Bustos Ramírez Luis Fernando on 01/09/16.
//  Copyright © 2016 Bustos Ramírez Luis Fernando. All rights reserved.
//

import Foundation






//https://cloud.google.com/translate/v2/quickstart

func translateText(text: String, languageOrigin: String, languageFinal: String,completionHandler : ((translateResponse : NSDictionary) -> Void)) {
    var urlPath = "http://api.mymemory.translated.net/get?q="
    var languageToChange = "\(languageOrigin)|\(languageFinal)"
    languageToChange = languageToChange.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())!
    let textToChange = text.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
    urlPath = urlPath+textToChange!+"&langpair="+languageToChange
    NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: urlPath)!) { (data, response, error) in
        var json: [String: AnyObject]!
        do {
            json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions()) as? [String: AnyObject]
        } catch {
            print(error)
        }
        let responseData =  json.removeValueForKey("responseData")
        completionHandler(translateResponse: responseData! as! NSDictionary)
    }.resume()
}
