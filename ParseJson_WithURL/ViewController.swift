//
//  ViewController.swift
//  ParseJson_WithURL
//
//  Created by Felipe Ignacio Zapata Riffo on 22-07-21.
//

import UIKit

struct WeatherForecast:Codable{
    let product:String?
    let dataseries:[dataSeries]
}

struct dataSeries:Codable{
    let timepoint: Int
    let cloudcover: Int
    let seeing: Int
    let transparency: Int
    let lifted_index: Int
    let rh2m: Int
    let wind10m:Wind10m
    let temp2m: Int
    let prec_type: String
}

struct Wind10m:Codable {
    let direction: String
    let speed: Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0"
        getData(url: url)
    }
    private func getData(url:String){
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("some error here")
                return
            }
            //have data
            var results: WeatherForecast?
            do {
                results = try! JSONDecoder().decode(WeatherForecast.self, from: data)
            }
            catch {
                print("error to convert json")
            }
            guard let json = results else {
                return
            }
            print(json.product!)
            print(json.dataseries)
        })
        task.resume()
        
    }
}

