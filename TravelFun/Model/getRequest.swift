//
//  getRequest.swift
//  TravelFun
//
//  Created by 陳冠銘 on 2021/1/6.
//  Copyright © 2021 NDHU_CSIE. All rights reserved.
//

import UIKit

struct getRequestData: Decodable {
    var total: Int
    var data: [getRequestData2]
}
struct getRequestData2: Decodable {
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
}
struct Category: Decodable{
    var id: Int
    var name: String
}
struct Target: Decodable{
    var id: Int
    var name: String
}
struct Images: Decodable{
    var src: String
    var subject: String
    var ext: String
}
var traveldataget: [getRequestData2]?=[]
var getPageCount = 0
var maxPage = 2
func getTravelData(){
    let address = "https://www.travel.taipei/open-api/zh-tw/Attractions/All?page="+String(getPageCount+1)
    if let url = URL(string: address) {
        // GET
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "accept")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if let response = response as? HTTPURLResponse,let data = data {
                print("Status code: \(response.statusCode)")
                let decoder = JSONDecoder()
                if let travelData = try? decoder.decode(getRequestData.self, from: data) {
                    print("============== Travel data ==============")
                    print(travelData.data)
                    print("============== Travel data ==============")
                    maxPage = (travelData.total/30)+1
                    traveldataget = travelData.data
                    getPageCount += 1
                    print(maxPage)
                    print(getPageCount)
                }
                else{print("有些欄位有問題")}
            }
        }.resume()
        
    } else {
        print("Invalid URL.")
        
    }
}
