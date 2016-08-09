//
//  WeatherViewController.swift
//  ZCJWeather
//
//  Created by zhangchaojie on 16/6/21.
//  Copyright © 2016年 zhangchaojie. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit
import SwiftyJSON

class WeatherViewController: UIViewController {

    var todayView: WeatherView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()

        setupData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupData(){
        
//        let url = "http://api.map.baidu.com/telematics/v3/weather?location=杭州&output=json&ak=FK9mkfdQsloEngodbFl4FeY3"
        Alamofire.request(.GET, "http://v.juhe.cn/weather/index", parameters: ["format": "2", "cityname": "杭州", "key": "ec1db2cf89e990486a2db7135b795302"])
            .responseJSON { response in
                
                let json = JSON(response.result.value!)["result"]
                let location = json["today"]["city"].stringValue
                let temperature = json["today"]["temperature"].stringValue
                let date = json["today"]["date_y"].stringValue
                let icon = json["today"]["weather_id"]["fa"].stringValue
                
                let weather = Weather(location: location, date: date, iconText: icon, temperature: temperature)
                let wv = WeatherViewModel.viewModelWith(weather)
                
                self.todayView.bindDataWithViewModel(wv)
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
