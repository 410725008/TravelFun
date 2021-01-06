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
        
        let sourceArray: [getRequestData2] = [TravelFun.getRequestData2(id: 130, name: "碧砂漁港", introduction: "碧砂漁港為一著名的觀光漁市，兩棟主要長形建築物，分別是「漁市場」和「飲食街」。漁市場內匯集了數十家生鮮海產店，供應各式各樣漁產，從遠洋、近海、沿岸、養殖應有盡有。旁邊的飲食街除可在店內點菜外，也可將選購之海產交給店家代為料理。\r\n\r\n碧砂漁港為基隆新興的漁港，發展方向以休閒觀光為主，是目前政府極力發展海上觀光業的一處主力港口。到了碧砂漁港，多的是各式各樣的活海鮮任君挑選，重新規劃的魚市內，如同廟口小吃整齊的規劃讓您一目了然。若你想飽餐一頓，碧砂飲食街有整排的海產店等你來光臨。\r\n\r\n想搭乘觀光遊艇，大人與小孩均需要身分證、 駕照、健保卡或戶口名簿。", open_status: 1, open_time: "開放式空間，無時間限制", zipcode: "202", distric: "中正區", address: "202 基隆市中正區北寧路211號(海洋大學附近)", tel: "+886-2-24693606、+886-2-24691822", email: "", months: "01,07,02,08,03,09,04,10,05,11,06,12", nlat: 25.14786, elong: 121.78421, official_site: "", facebook: "", ticket: "", remind: "備註事項:遊客如欲搭船出海，應備妥身分證明文件以供查驗（幼童須健保卡）。", staytime: "", modified: "2020-12-28 17:24:09 +08:00", url: "https://www.travel.taipei/zh-tw/attraction/details/130", category: [TravelFun.Category(id: 20, name: "北北基景點")], target: [TravelFun.Target(id: 61, name: "親子共學")], images: []),TravelFun.getRequestData2(id: 1584, name: "艋舺服飾商圈", introduction: "來到萬華，龍山商場後面、全臺知名的大理街艋舺服飾商圈是必逛的成衣大街，這裡也是來自各地批客們批發各式服飾的大本營。\r\n\r\n艋舺服飾商圈成因是艋舺開發很早，加上萬華火車站就位在這兒，交通往來、交易方便，形成了一大成衣市集。早期這裡曾有高達近2千家各式服飾店面，並且從設計、打版、生產、行銷一貫作業，品質和價格都十分具有競爭力。後來因時代變遷，服飾商圈現在僅存約4百家店，服飾的種類也較偏向成熟的女裝，約佔所有店家的八成，另外一成是童裝，還有團體服的訂製，至於男裝則已越來越少，甚至和團體服併在一起，和五分埔走年輕女性、活潑風格有明顯的不同。\r\n\r\n平日這裡車水馬龍都是補貨、送貨的卡車和批客的車子，也有些客人是專程搭車來挖寶的，各種款式的服飾、配件，走一趟下來，讓人看得眼花撩亂。", open_status: 1, open_time: "", zipcode: "108", distric: "萬華區", address: "108 臺北市萬華區位於萬華區大理街、西園路、和平西路、康定路附近", tel: "", email: "", months: "01,07,02,08,03,09,04,10,05,11,06,12", nlat: 25.03483, elong: 121.49922, official_site: "", facebook: "https://www.facebook.com/taipeimoga/", ticket: "", remind: "", staytime: "", modified: "2020-12-28 16:53:44 +08:00", url: "https://www.travel.taipei/zh-tw/attraction/details/1584", category: [TravelFun.Category(id: 24, name: "主題商街")], target: [], images: [TravelFun.Images(src: "https://www.travel.taipei/image/89134", subject: "", ext: ".jpg"), TravelFun.Images(src: "https://www.travel.taipei/image/89135", subject: "", ext: ".jpg"), TravelFun.Images(src: "https://www.travel.taipei/image/89131", subject: "", ext: ".jpg"), TravelFun.Images(src: "https://www.travel.taipei/image/89132", subject: "", ext: ".jpg"), TravelFun.Images(src: "https://www.travel.taipei/image/89133", subject: "", ext: ".jpg")])]
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

