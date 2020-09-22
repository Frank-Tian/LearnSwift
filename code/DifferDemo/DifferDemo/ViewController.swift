//
//  ViewController.swift
//  DifferDemo
//
//  Created by Tian on 2020/9/22.
//  Copyright © 2020 ziyingtech. All rights reserved.
//

import UIKit

struct Item {
    var key: String = ""
    var url: String = ""
}

class ViewController: UIViewController {

    var origin: [Dictionary<String, Any>]?
    var current: [Dictionary<String, Any>]?
    var dict: [String: String] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        origin = loadPlistFile(from: "original")
        current = loadPlistFile(from: "new")
        
        if origin != nil, current != nil {
            print("origin count: \(origin!.count), current count:\(current!.count)")
            for (i,v) in origin!.enumerated() {
                let key: String = v["key"] as! String
                let url: String = v["url"] as! String
                print("\(i) key: \(key) \nurl:\(url)")
                dict[key] = url
            }
            
            for item in current! {
                let key: String = item["key"] as! String
                let url: String = item["url"] as! String
                if let item = dict[key], item == url {
                    print("SAME---------")
                } else {
                    print("---------DIFF1")
                    print("\(key):\(url)")
                    print("---------DIFF2")
                }
            }
        }
    }
    
    func loadPlistFile(from name: String) ->[Dictionary<String, Any>]? {
        if let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let plist = FileManager.default.contents(atPath: path) {
            return (try? PropertyListSerialization.propertyList(from: plist, options: .mutableContainersAndLeaves, format: nil)) as? [Dictionary]
        }
        return nil
    }
}

