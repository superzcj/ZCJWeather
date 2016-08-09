//
//  WeatherViewModel.swift
//  ZCJWeather
//
//  Created by zhangchaojie on 16/6/21.
//  Copyright © 2016年 zhangchaojie. All rights reserved.
//

import Foundation
import SwiftDate

class WeatherViewModel: NSObject {
    
    var date: String?
    var iconText: String?
    var loction: String?
    var temperature: String?
    var season: String?
    
    
    class func viewModelWith(weather: Weather) -> WeatherViewModel{
        let date = weather.date?.toDate(DateFormat.Custom("yyyy年MM月dd日"))
        
        var iconText = ""
        switch weather.iconText! {
        case "00":
            iconText = "晴"
        case "01":
            iconText = "多云"
        case "02":
            iconText = "阴"
        case "03":
            iconText = "阵雨"
        case "04":
            iconText = "雷阵雨"
        case "07":
            iconText = "小雨"
        case "08":
            iconText = "中雨"
        case "09":
            iconText = "大雨"
        case "10":
            iconText = "暴雨"
        case "11":
            iconText = "特大暴雨"
        case "21":
            iconText = "小雨-中雨"
        case "22":
            iconText = "中雨-大雨"
        case "23":
            iconText = "大雨-暴雨"
        default: break
            
        }
        
        let wvm = WeatherViewModel()
        wvm.date = String(date!.month) + "\\" + String(date!.day)
        wvm.loction = weather.location
        wvm.temperature = weather.temperature
        wvm.iconText = iconText
        return wvm
    }
    
}
