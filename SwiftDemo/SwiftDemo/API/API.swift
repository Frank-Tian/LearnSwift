//
//  API.swift
//  SwiftDemo
//
//  Created by Tian on 2020/11/15.
//

import Foundation
import ObjectMapper

/// 数据采集请求模型
struct SignCheckReuqest: Mappable {
    var app: String?
    var ide: String?
    var os: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        app     <- map["app"]
        ide     <- map["ide"]
        os      <- map["os"]
    }
}

/// 版本升级请求
struct VersionCheckRequest: Mappable {
    var app: String?
    var cardID: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        app     <- map["app"]
        cardID  <- map["card_id"]
    }
}

/// 校验结果响应
struct SignCheckResult: Mappable {
    var checkResult: Bool = true
    var checkInfo: String = ""
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        checkResult     <- map["sign_check_result"]
        checkInfo       <- map["sign_check_info"]
    }
}

/// 版本升级请求响应
struct VersionCheckResult: Mappable {
    var packagesChanged: Bool = false
    var packagesChangeInfo: String = ""
    var scriptChanged: Bool = false
    var scriptChangeInfo: String  = ""
    var cloudUrl: String = ""

    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        packagesChanged         <- map["packages_if_change"]
        packagesChangeInfo      <- map["packages_change_info"]
        scriptChanged           <- map["script_if_change"]
        scriptChangeInfo        <- map["script_change_info"]
        cloudUrl                <- map["cloud_url"]
    }
}

class API {
    
    /// 客户端-构建信息上报&校验接口
    /// 说明： 上报&sign值校验，返回变化的部分
    /// 请求URI：/api/v1/controlcenter/sdk/client/build/info/add
    /// 请求方法：POST
    class func versionCheck(_ request: VersionCheckRequest, completion: ((_ res: VersionCheckResult?, _ error: RequestError?) -> Void)?) {
        let url = "/api_server/v1/versionCheck"
        NetworkProvider.post(url: url, params: nil, body: request.toJSON(), type: VersionCheckResult.self) { (res, err) in
            if let finished = completion {
                finished(res, err)
            }
        }
    }
    
    class func signCheck(_ request: SignCheckReuqest, completion: ((_ res: SignCheckResult?, _ error: RequestError?) -> Void)?) {
        let url = "/api_server/v1/signCheck"
        NetworkProvider.post(url: url, params: nil, body: request.toJSON(), type: SignCheckResult.self) { (res, err) in
            if let finished = completion {
                finished(res, err)
            }
        }
    }
}
