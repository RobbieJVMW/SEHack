//
//  ViewController.swift
//  FunkyApp
//
//  Created by Paul Nothard on 22/07/2016.
//  Copyright © 2016 Paul Nothard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, XMLParserDelegate {

    
    
    @IBOutlet weak var test: UISwitch!
    
    // Setup variables
    var pickerData = [String]() // array holding the temp/pressure strings
    var parserT=XMLParser()
    var parserP=XMLParser()

    var strXMLData:String = ""
    var currentElement:String = ""
    var lastdate:String=""
    var lastvalue:String=""
    var lasttype:String=""
    var readings=[String:String]()
    var temperatureReadings=[String:String]()
    var pressureReadings=[String:String]()
    var parser = XMLParser()


    @IBOutlet weak var TempOrPressurePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Do funky shit
        self.TempOrPressurePicker.delegate = self
        self.TempOrPressurePicker.dataSource = self
        
        // PickerData Values
        pickerData=["Temperature", "Pressure"]
        
        // Get the data for the first time and display
        let baseURL = "http://52.16.112.87/api.php?function=getReading&value=1"
        
        // Temperature
        let tempURL: URL = URL(string: baseURL+"&type=temperature")!
        parser = XMLParser(contentsOf: tempURL)!
        parser.delegate = self
        //var works = parser.parse()
        parser.parse() //test
        temperatureReadings = readings
        
        // Pressure - not used this time round
        let pressureURL: URL = URL(string: baseURL+"&type=pressure")!
        parser = XMLParser(contentsOf: pressureURL)!
        parser.delegate = self
        //works = parser.parse()
        parser.parse()  //test
        pressureReadings = readings
        
        // PRINT IT for initial display
//        valueLabel.text = temperatureReadings["2016-07-22 12:30:52"]
        valueLabel.text = temperatureReadings.first?.1
        
    }
    
    
    
    // <START CODE FRAG>
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
//        print("Element's name is \(elementName)")
        currentElement=elementName;
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if(elementName == "reading")
        {
//            print ("Setting a reading")
            readings[lastdate]=lastvalue
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
    // <END CODE FRAG>
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    // Number of rows of data
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if TempOrPressurePicker.selectedRow(inComponent: 0)==0 {
        valueLabel.text = temperatureReadings.first?.1
        //valueLabel.text = "ZERO"
        } else {
        valueLabel.text = pressureReadings.first?.1
        //valueLabel.text = "ONE"
        }
    }
    
    // Populate picker with string (looked up from array)
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBAction func dostuff(_ sender: UIButton) {
        // Sync button pressd, let's do stuff
        
        // Go get the the data
        // http get for temp ... max 50 rows
        // TEMP[] = HTTP GET

        // http get for pressure ... max 50 rows
        // PRESSURE[] = HTTP GET
        
        // Set the first value
        
        print("BUTTON")
        
        
        // Get the data for the first time and display
        let baseURL = "http://52.16.112.87/api.php?function=getReading&value=1"
        
        // Temperature
        let tempURL: URL = URL(string: baseURL+"&type=temperature")!
        parser = XMLParser(contentsOf: tempURL)!
        parser.delegate = self
//        var works = parser.parse()
        parser.parse()      //test
        temperatureReadings = readings
        
        // Pressure - not used this time round
        let pressureURL: URL = URL(string: baseURL+"&type=pressure")!
        parser = XMLParser(contentsOf: pressureURL)!
        parser.delegate = self
//        works = parser.parse()
        parser.parse()  // test
        pressureReadings = readings
        
        // What does the picker say, and update as appropriate
        if TempOrPressurePicker.selectedRow(inComponent: 0)==0 {
            valueLabel.text = temperatureReadings.first?.1
            print("ZERO")
//            valueLabel.text = "ZERO"
        } else {
            valueLabel.text = pressureReadings.first?.1
            print("ONE")
//            valueLabel.text = "ONE"
        }
        
        
    }

}

