//
//  Entities.swift
//  ParseJson_WithURL
//
//  Created by Felipe Ignacio Zapata Riffo on 22-07-21.
//

import Foundation

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
