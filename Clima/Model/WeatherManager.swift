//
//  WeatherManager.swift
//  Clima
//
//  Created by Gustavo Mendonca on 11/04/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpadateWeather(_ watherManager: WeatherManager,weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=80ce5549e68fe8f36f5705d662e812b1&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    
    func fechWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        self.performRequest(urlString: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude:CLLocationDegrees){
        
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(urlString: urlString)
        
    }
    
    func performRequest(urlString : String){
        //1.criar a URL
        if let url = URL(string: urlString){
            // 2.ciar a URLSession
            let session = URLSession(configuration: .default)
            
            //3. passar uma tarefa a session
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(delegate?.didFailWithError(error: error!))
                    return
                }
                
                if let safeData = data{
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpadateWeather(self, weather: weather)

                    }
                    
                }
            }
            
            // 4. start the task
            task.resume()
        }
    }
    
    func parseJSON(_  weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
           // print(weather.getConditionName(weather.con)
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }

}
