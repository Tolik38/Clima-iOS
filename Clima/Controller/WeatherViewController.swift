//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //text field should report back to view controller ..ie types return
        searchTextField.delegate = self
    }
    
    //MARK: Actions
    
    @IBAction func searchBtnWasPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        
    }
    
    // return btn pressed via delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //dismiss keyboard
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    // textfield should editiing - Make sure the user entered text - Data Validation
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""  {
            return true
        } else {
            textField.placeholder = "Dont forget to type the words dork"
            return false
        }
    }
    
    // delegate method to clear search field after end editiing
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        // use searchfield.text to get weather for that city
        
        //clear textfield after typing
        searchTextField.text = ""
    }
    
}

