//
//  NetworkTools.swift
//  test_swift_tableView
//
//  Created by keji shengui on 2018/6/14.
//  Copyright © 2018年 kejishengui. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}

class NetworkTools: NSObject {

    // class方法 --> oc + 开头的
    
    class  func requestData(URLString:String, type:MethodType, parameters : [String : Any]? = nil, finishedCallback: @escaping (_ result : Any) -> ()){
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            
            // 校验 返回结果  如果返回的有值 则将返回值 赋给result ，如果没有值则直接返回
            guard let  result = response.result.value else{ return}
            
            // 将返回值通过 逃逸闭包传递出去
            finishedCallback(result)
        }
    }
}






































