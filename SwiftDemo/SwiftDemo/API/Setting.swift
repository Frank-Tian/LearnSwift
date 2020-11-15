//
//  Setting.swift
//  SwiftDemo
//
//  Created by Tian on 2020/11/15.
//

import Foundation

struct Constants {
    static let ScriptVersion = "0.1.0"
    static let APIVersion = ""
    static let BASE_URL = "http://10.100.130.28:7088"
}

class Setting {
    
    static var _appID: String = ""
    
    class func scriptVersion() -> String {
        return Constants.ScriptVersion
    }
    
    class func appID() -> String {
        if _appID.count < 1 {
            _appID = "xxx"
        }
        return _appID
    }
    
    class func baseURL() -> String {
        return Constants.BASE_URL
    }
}
