//
//  TravelData.swift
//  FoodPin
//
//  Created by NDHU_CSIE on 2020/11/19.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//
// 使用https://www.travel.taipei/open-api/swagger/ui/index#/Tours/Tours_Theme
//提供的API

import UIKit
import CoreData

class TravelData {
    var id: Int
    var name: String
    var introduction: String
    var open_status: Int
    var open_time: String
    var zipcode: String
    var distric: String
    var address: String
    var tel: String
    var email: String
    var months: String
    var nlat: Double
    var elong: Double
    var official_site: String
    var facebook: String
    var ticket: String
    var remind: String
    var staytime: String
    var modified: String
    var url: String
    var category: [Category]
    var target: [Target]
    var images: [Images]
    var image:String
    var image2: String
    var isVisited: Bool
    var weather: String
    
    init(id: Int,name: String,name_zh: String,open_status: Int,introduction: String,open_time: String,zipcode: String,distric: String,address: String,tel: String,email: String,months: String,nlat: Double,elong: Double,official_site: String,facebook: String,ticket: String,remind: String,staytime: String,modified: String,url: String,category: [Category],target: [Target],images: [Images]) {
        self.id = id
        self.name = name
        self.open_status = open_status
        self.introduction = introduction
        self.open_time = open_time
        self.zipcode = zipcode
        self.distric = distric
        self.address = address
        self.tel = tel
        self.email = email
        self.months = months
        self.nlat = nlat
        self.elong = elong
        self.official_site = official_site
        self.facebook = facebook
        self.ticket = ticket
        self.remind = remind
        self.staytime = staytime
        self.modified = modified
        self.url = url
        self.category = category
        self.target = target
        self.images = images
        self.image = ""
        self.image2 = ""
        self.isVisited = false
        self.weather = ""
    }
    
    static func writeTravelDataFromBegin() {
        
        let sourceArray: [getRequestData2] = [TravelFun.getRequestData2(id: 0, name: "歡迎使用", introduction: "歡迎使用本程式", open_status: 1, open_time: "", zipcode: "", distric: "Welcome", address: "花蓮縣壽豐鄉東華大學", tel: "+886934001647", email: "410725008@gms.ndhu.edu.tw", months: "", nlat: 23.892993, elong: 121.534839, official_site: "", facebook: "", ticket: "", remind: "備註事項:", staytime: "", modified: "2021-01-07 05:50:09 +08:00", url: "https://github.com/410725008/TravelFun", category: [], target: [], images: [])]
        print("sourceArray",sourceArray)
        var TravelData: TravelDataMO!
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            for i in 0..<sourceArray.count {
                TravelData = TravelDataMO(context: appDelegate.persistentContainer.viewContext)
                TravelData.id = String(sourceArray[i].id)
                TravelData.name = sourceArray[i].name
                TravelData.open_status = String(sourceArray[i].open_status)
                TravelData.introduction = sourceArray[i].introduction
                TravelData.open_time = sourceArray[i].open_time
                TravelData.zipcode = sourceArray[i].zipcode
                TravelData.distric = sourceArray[i].distric
                TravelData.address = sourceArray[i].address
                TravelData.tel = sourceArray[i].tel
                TravelData.email = sourceArray[i].email
                TravelData.months = sourceArray[i].months
                TravelData.nlat = sourceArray[i].nlat
                TravelData.elong = sourceArray[i].elong
                TravelData.official_site = sourceArray[i].official_site
                TravelData.facebook = sourceArray[i].facebook
                TravelData.ticket = sourceArray[i].ticket
                TravelData.remind = sourceArray[i].remind
                TravelData.staytime = sourceArray[i].staytime
                TravelData.modified = sourceArray[i].modified
                TravelData.url = sourceArray[i].url
                /*
                 TravelData.category = sourceArray[i].category as NSObject
                 TravelData.target = sourceArray[i].target as NSObject*/
                //TravelData.images = sourceArray[i].images
                TravelData.isVisited = false
                TravelData.rating = nil
                if sourceArray[i].images.isEmpty {
                    TravelData.image = "foodpin-logo"
                }else{
                    TravelData.image = sourceArray[i].images[0].src
                }
                
            }
            appDelegate.saveContext() //write once for all new restauranrs
        }
    }
    
    static func AppendTravelData(sourceArray:[getRequestData2]) {
        print("sourceArray",sourceArray)
        var TravelData: TravelDataMO!
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            for i in 0..<sourceArray.count {
                TravelData = TravelDataMO(context: appDelegate.persistentContainer.viewContext)
                TravelData.id = String(sourceArray[i].id)
                TravelData.name = sourceArray[i].name
                TravelData.open_status = String(sourceArray[i].open_status)
                TravelData.introduction = sourceArray[i].introduction
                TravelData.open_time = sourceArray[i].open_time
                TravelData.zipcode = sourceArray[i].zipcode
                TravelData.distric = sourceArray[i].distric
                TravelData.address = sourceArray[i].address
                TravelData.tel = sourceArray[i].tel
                TravelData.email = sourceArray[i].email
                TravelData.months = sourceArray[i].months
                TravelData.nlat = sourceArray[i].nlat
                TravelData.elong = sourceArray[i].elong
                TravelData.official_site = sourceArray[i].official_site
                TravelData.facebook = sourceArray[i].facebook
                TravelData.ticket = sourceArray[i].ticket
                TravelData.remind = sourceArray[i].remind
                TravelData.staytime = sourceArray[i].staytime
                TravelData.modified = sourceArray[i].modified
                TravelData.url = sourceArray[i].url
                /*
                 TravelData.category = sourceArray[i].category as NSObject
                 TravelData.target = sourceArray[i].target as NSObject*/
                //TravelData.images = sourceArray[i].images
                TravelData.isVisited = false
                TravelData.rating = nil
                if sourceArray[i].images.isEmpty {
                    TravelData.image = "foodpin-logo"
                }else{
                    TravelData.image = sourceArray[i].images[0].src
                }
                
            }
            appDelegate.saveContext() //write once for all new restauranrs
        }
    }
}

