//
//  Data.swift
//  MovieDemo
//
//  Created by Tian on 2020/7/2.
//

import Foundation

struct Movie: Identifiable {
    var name : String
    var id = UUID()
    var image: String
}



let MovieList:[Movie] = [
    
    Movie(name: "大话西游", image: "dhxy"),
    Movie(name: "肖申克的救赎", image: "xskdjs"),
    Movie(name: "绿皮书", image: "lps"),
    Movie(name: "盗梦空间", image: "dmkj"),
    Movie(name: "你的名字", image: "ndmz"),
    Movie(name: "三傻大闹宝莱屋", image: "ssdnblw"),
    Movie(name: "我不是药神", image: "wbsys"),
    Movie(name: "疯狂动物城", image: "fkdwc"),
    Movie(name: "这个杀手不太冷", image: "zgssbtl"),
    Movie(name: "海上钢琴师", image: "hsgqs"),
]
