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
    
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    // in case the searchTextField is empty, the placeholder will appear
    // type something for the user
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            searchTextField.placeholder = "Type something"
            return false
        }
    }
    
    // cleaning the searchField
    func textFieldDidEndEditing(_ textField: UITextField) {
        //use the searchTextfield to get the weather for that city
        
        if let city = searchTextField.text{
            weatherManager.featchWeather(cityName: city)
        }
        
        searchTextField.text = ""
    }
    
    func didUpadateWeather(_ weather: WeatherModel) {
        print(weather.temperatureString)
    }

    

}

