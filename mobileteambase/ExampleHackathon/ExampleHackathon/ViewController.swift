//
//  ViewController.swift
//  ExampleHackathon
//
//  Created by Andrew Thomas on 18/11/2016.
//  Copyright © 2016 Andrew Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var temperatureReadings=[String:String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    
    
    
    
    // Can call this function using:
    //let url="aURL"
    //let urlToSend: URL = URL(string: url)!
    //parser = XMLParser(contentsOf: urlToSend)!
   // parser.delegate = self
    // var works=parser.parse()
    // Will return an array of values into the temperatureReadings array
    
    
    var strXMLData:String = ""
    var currentElement:String = ""
    var lastdate:String=""
    var lastvalue:String=""
    var lasttype:String=""
    var parser = XMLParser()

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        //        print("Element's name is \(elementName)")
        currentElement=elementName;
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if(elementName == "reading")
        {
            //            print ("Setting a reading")
            temperatureReadings[lastdate]=lastvalue
            //            print ("Reading set for \(lastdate) = \(lastvalue)")
        }
        //        print ("End Element is \(elementName)")
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if(string.characters.count > 3)
        {
            if(currentElement == "type") { lasttype=string}
            if(currentElement == "date"){ lastdate=string}
            if(currentElement == "value"){ lastvalue=string}
            //            print("Data is \(currentElement) : \(string)")
        }
        
    }
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        //NSLog("failure error: %@", parseError)
    }


}

