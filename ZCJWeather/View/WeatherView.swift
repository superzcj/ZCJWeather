//
//  WeatherView.swift
//  ZCJWeather
//
//  Created by zhangchaojie on 16/6/21.
//  Copyright © 2016年 zhangchaojie. All rights reserved.
//

import UIKit
import SnapKit

class WeatherView: UIView {

    var timeLbl: UILabel!
    var iconLbl: UILabel!
    var temperationLbl: UILabel!
    var cityLbl: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindDataWithViewModel(weatherViewModel: WeatherViewModel){
        timeLbl.text = weatherViewModel.date
        if weatherViewModel.date?.containsString("6") {
            
        }
        iconLbl.text = weatherViewModel.iconText
        temperationLbl.text = weatherViewModel.temperature
        cityLbl.text = weatherViewModel.loction
    }
    
    func setupView(){
        cityLbl = UILabel()
        cityLbl.textColor = UIColor.whiteColor()
        self.addSubview(cityLbl)
        cityLbl.snp_makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
        }
        
        timeLbl = UILabel()
        timeLbl.textColor = UIColor.whiteColor()
        timeLbl.text = "6/21"
        self.addSubview(timeLbl)
        timeLbl.snp_makeConstraints { (make) in
            make.top.equalTo(cityLbl.snp_bottom)
            make.left.equalTo(self)
            make.right.equalTo(self)
        }
        
        iconLbl = UILabel()
        iconLbl.textColor = UIColor.whiteColor()
        iconLbl.text = "\u{f010}"
        self.addSubview(iconLbl)
        iconLbl.snp_makeConstraints { (make) in
            make.top.equalTo(timeLbl.snp_bottom)
            make.left.equalTo(self)
            make.right.equalTo(self)
            
        }
        
        temperationLbl = UILabel()
        temperationLbl.textColor = UIColor.whiteColor()
        temperationLbl.text = "30"
        self.addSubview(temperationLbl)
        temperationLbl.snp_makeConstraints { (make) in
            make.top.equalTo(iconLbl.snp_bottom)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.bottom.equalTo(self)
        }

    }
}
