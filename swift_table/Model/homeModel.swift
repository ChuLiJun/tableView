//
//  homeModel.swift
//  test_swift_tableView
//
//  Created by keji shengui on 2018/6/14.
//  Copyright © 2018年 kejishengui. All rights reserved.
//

import UIKit
/*
 使用KVC条件
 1> 必须继承自NSObject
 2> 必须在构造函数中,先调用super.init()
 3> 调用setValuesForKeys
 4> 如果字典中某一个key没有对应的属性, 则需要重写setValue forUndefinedKey方法
 5> 3.0转4.0 属性前必须加上  @objc
 */

class homeModel: NSObject {

    //https://www.jianshu.com/p/36b5b7831b04
    
    // MARK: 定义属性
   @objc var replyCount : Int = 0
   @objc var title : String = ""
   @objc var source : String = ""
   @objc var imgsrc : String = ""
    
    //MARK -- 定义字典转模型的构造函数
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    
}
