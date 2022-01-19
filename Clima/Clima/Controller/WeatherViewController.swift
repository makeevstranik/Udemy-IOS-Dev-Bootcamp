
//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        weatherManager.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestLocation()
        searchTextField.text = ""
        
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        prepareTextFieldAndFetchWeather()
    }
    
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type The Place"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        prepareTextFieldAndFetchWeather()
    }
    
    func prepareTextFieldAndFetchWeather() {
        let city = max(searchTextField.text!, "Chelyabinsk")
        weatherManager.fetchWeather(cityName: city)
        searchTextField.text = ""
    }
}

// MARK: - extension CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let (lat, lon) = (location.coordinate.latitude, location.coordinate.longitude)
            weatherManager.fetchWeather(lat: lat, lon: lon)
        } else {
            print("no location")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error in location", error)
    }
    
}

// MARK: - extension WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weather: WeatherModel) {
        temperatureLabel.text = weather.tempString
        conditionImageView.image = UIImage(systemName: weather.conditions)
        cityLabel.text = weather.cityName
    }
    
    func didFailWithError(_ error: String) {
        print(error)
    }
}

