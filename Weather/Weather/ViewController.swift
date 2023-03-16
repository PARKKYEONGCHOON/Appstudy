//
//  ViewController.swift
//  Weather
//
//  Created by 박경춘 on 2023/03/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var cityNameTextField: UITextField!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var weatherDiscription: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var hightempLabel: UILabel!
    @IBOutlet var lowtempLabel: UILabel!
    
    @IBOutlet var weatherStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loadWeatherButton(_ sender: UIButton) {
        if let cityName = self.cityNameTextField.text {
            self.getCurrentWeather(cityName: cityName)
            self.view.endEditing(true)
        }
    }
    
    func configureView(weatherInfo: WeatherInformation){
        self.cityNameLabel.text = weatherInfo.name
        if let weather = weatherInfo.weather.first {
            self.weatherDiscription.text = weather.description
        }
        
        self.tempLabel.text = "\(Int(weatherInfo.temp.temp - 273.15))℃"
        self.hightempLabel.text = "최고 : \(Int(weatherInfo.temp.highTemp - 273.15))℃"
        self.lowtempLabel.text = "최저 : \(Int(weatherInfo.temp.lowTemp - 273.15))℃"
        
        
    }
    
    func getCurrentWeather(cityName: String){
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=3e1e848a5e6eadf2235a682cd13a8f12") else { return }
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { [weak self] data, reponse, error in
            let succesRange = (200..<300)
            guard let data = data, error == nil else { return }
            let decoder = JSONDecoder()
            if let reponse = reponse as? HTTPURLResponse, succesRange.contains(reponse.statusCode) {
                guard let weatherInfo = try? decoder.decode(WeatherInformation.self, from: data) else { return }
                
                DispatchQueue.main.async {
                    self?.weatherStackView.isHidden = false
                    self?.configureView(weatherInfo: weatherInfo)
                }
            }
            else {
                guard let errorMessage = try? decoder.decode(ErrorMessage.self, from: data) else { return }
                
                DispatchQueue.main.async {
                    self?.ShowAlert(message: errorMessage.message)
                }
            }
            
            
        }.resume()
        
    }
    
    func ShowAlert(message: String){
        let alert = UIAlertController(title: "에러", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

