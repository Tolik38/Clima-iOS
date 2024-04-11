//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        
        searchTextField.delegate = self
    }
    
    
    @IBAction func searchButton(_ sender: UIButton) {
        //tirando o teclado quando clicar em ir no textField
        searchTextField.endEditing(true)
        
        
        print(searchTextField.text!)
       
    }
    
    //funcao para retornar o que o textField precisa retornar
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        return true
    }
    
    // essa função serve para validar o que o usuario digitou
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "Type something"
            return false
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        if let city = searchTextField.text{
            weatherManager.fechWeather(cityName: city)
        }
        
        //quando apertar para pesquisar, deixara o textField vazio
        searchTextField.text = ""
    }
    
    
    func didUpadateWeather(_ watherManager: WeatherManager,weather: WeatherModel){
        temperatureLabel.text = weather.temperatureString
    }
    
    func didFailWithError(error: any Error) {
        print(error)
    }
    
}

