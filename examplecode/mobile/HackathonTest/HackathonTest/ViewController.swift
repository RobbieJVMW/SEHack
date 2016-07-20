//
//  ViewController.swift
//  HackathonTest
//
//  Created by Andrew Thomas on 18/07/2016.
//  Copyright © 2016 Andrew Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSXMLParserDelegate {
    
    
    var strXMLData:String = ""
    var currentElement:String = ""
    var lastdate:String=""
    var lastvalue:String=""
    var lasttype:String=""

    var parser = NSXMLParser()
    var temperatureReadings=[String:String]()
    
    
    @IBOutlet weak var reading: UILabel!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func getReading(sender: UIButton) {
        
        temperatureReadings.removeAll()
        
        let url:String="http://52.16.112.87/api.php?function=getReading&type=temperature&value=5"
        let urlToSend: NSURL = NSURL(string: url)!
        // Parse the XML
        parser = NSXMLParser(contentsOfURL: urlToSend)!
        parser.delegate = self
        
        let success:Bool = parser.parse()
        
        if success {
            print("parse success!")
            reading.text="Readings retrieved: \n"

            
        } else {
            print("parse failure!")
        }
        
        for (datevalue, tempvalue) in temperatureReadings {
            print("The reading was \(datevalue) = \(tempvalue)")
            reading.text = (reading.text ?? "") + "\(datevalue) = \(tempvalue)\n"


        }
  

        
    }
    
    

    
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        print("Element's name is \(elementName)")
        currentElement=elementName;
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if(elementName == "reading")
        {
            print ("Setting a temperature reading")
            temperatureReadings[lastdate]=lastvalue
            print ("Reading set for \(lastdate) = \(lastvalue)")
        }
        print ("End Element is \(elementName)")
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if(string.characters.count > 3)
        {
        if(currentElement == "type") { lasttype=string}
        if(currentElement == "date"){ lastdate=string}
        if(currentElement == "value"){ lastvalue=string}
                        print("Data is \(currentElement) : \(string)")
        }
        

        
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        NSLog("failure error: %@", parseError)
    }
    
    
   }

