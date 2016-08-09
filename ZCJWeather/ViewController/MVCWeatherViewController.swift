//
//  MVCWeatherViewController.swift
//  ZCJWeather
//
//  Created by zhangchaojie on 16/6/23.
//  Copyright © 2016年 zhangchaojie. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit
import SwiftyJSON
import SwiftDate

class MVCWeatherViewController: UIViewController {
    
    var todayView: WeatherView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        setupData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func setupData(){
        
        Alamofire.request(.GET, "http://v.juhe.cn/weather/index", parameters: ["format": "2", "cityname": "杭州", "key": "ec1db2cf89e990486a2db7135b795302"])
            .responseJSON { response in
                
                let json = JSON(response.result.value!)["result"]
                let location = json["today"]["city"].stringValue
                let temperature = json["today"]["temperature"].stringValue
                let dateStr = json["today"]["date_y"].stringValue
                let icon = json["today"]["weather_id"]["fa"].stringValue
                
                let weather = Weather(location: location, date: dateStr, iconText: icon, temperature: temperature)
                
                //20161101
                let date = weather.date?.toDate(DateFormat.Custom("yyyy年MM月dd日"))
                
                //00 01
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
                
                
                self.todayView.timeLbl.text = String(date!.month) + "\\" + String(date!.day)
                self.todayView.cityLbl.text = weather.location
                self.todayView.temperationLbl.text = weather.temperature
                self.todayView.iconLbl.text = iconText
        }
    }
    
    func setupView(){
        view.backgroundColor = UIColor.grayColor()
        
        todayView = WeatherView()
        view.addSubview(todayView)
        todayView.snp_makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.width.equalTo(56*2)
            make.height.equalTo(90)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
