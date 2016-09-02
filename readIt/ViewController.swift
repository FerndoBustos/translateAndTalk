//
//  ViewController.swift
//  readIt
//
//  Created by Bustos Ramírez Luis Fernando on 01/09/16.
//  Copyright © 2016 Bustos Ramírez Luis Fernando. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var textToTranslate: UITextView!
    @IBOutlet weak var languageControl: UISegmentedControl!
    @IBOutlet weak var textTranslated: UITextView!
    
    var languages = [language]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareLenguaje()
        languageControl.removeAllSegments()
        for language in languages.reverse(){
            languageControl.insertSegmentWithTitle(language.name, atIndex: 0, animated: true)
        }
        languageControl.selectedSegmentIndex = 0
    }
    
    func prepareLenguaje(){
        let french = language(name: "Frances", iso639: "fr-FR")
        let spanishMX = language(name: "Español-MX", iso639: "es-MX")
        let english = language(name: "Ingles", iso639: "en-US")
        let chinese = language(name: "Chino", iso639: "zh-CN")
        languages = [spanishMX!, english!, french!, chinese!]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func translate(sender: AnyObject) {
        var languageSelected: String
        languageSelected = languages[languageControl.selectedSegmentIndex].iso639
        
        let textToSpech = textToTranslate.text
        
        // Do any additional setup after loading the view, typically from a nib.
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: textToSpech) //oration to say
        utterance.rate = 0.5 //speed to talk
        utterance.voice = AVSpeechSynthesisVoice(language: languageSelected) //we can costumner the lenguaje
        synthesizer.speakUtterance(utterance);
        
        for voice in AVSpeechSynthesisVoice.speechVoices() {
            print(voice.language);
        }
    }
    
    //http://nshipster.com/avspeechsynthesizer/
    
}
