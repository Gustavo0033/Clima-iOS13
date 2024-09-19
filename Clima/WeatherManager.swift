//
//  WeatherManager.swift
//  Clima
//
//  Created by Gustavo Mendonca on 19/09/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct  WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?q="
    let endURL = "&appid=80ce5549e68fe8f36f5705d662e812b1"
    
    func featchWeather(cityName: String){
        let urlString = "\(weatherURL)\(cityName)\(endURL)"
        performRequest(urlString: urlString)
    }
    
    //MARK: - execute de request of the API
    func performRequest(urlString: String){
        
        //create the URL
        if let url = URL(string: urlString){
            
            // create the urlSession
            let session = URLSession(configuration: .default)
            
            // give for our session a task
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data{
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            // start task
            task.resume()
        }
    }
    
    //MARK: - prints the api request response
    func handler(data: Data?, response: URLResponse?, error: Error?){
        if error != nil{
            print(error!)
            return
        }
        if let safeData = data{
            let dataString = String(data: safeData, encoding: .utf8)
        }
    }
    
    //MARK: - this func is receiving the JSON's data and  transforming to a swift object
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.name)
        }catch{
            print(error)
        }
    }
}
