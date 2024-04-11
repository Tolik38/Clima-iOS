//
//  WeatherManager.swift
//  Clima
//
//  Created by Gustavo Mendonca on 11/04/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=80ce5549e68fe8f36f5705d662e812b1"
    
    
    func fechWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        self.performRequest(urlString: urlString)
    }
    
    func performRequest(urlString : String){
        //1.criar a URL
        if let url = URL(string: urlString){
            // 2.ciar a URLSession
            let session = URLSession(configuration: .default)
            
            //3. passar uma tarefa a session
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data{
                    self.parseJSON(weatherData: safeData)
                    
                }
            }
            
            // 4. start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.clouds.all)
        }catch{
            print(error)
        }
        
    }
}
