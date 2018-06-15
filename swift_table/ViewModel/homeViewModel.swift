//
//  homeViewModel.swift
//  test_swift_tableView
//
//  Created by keji shengui on 2018/6/14.
//  Copyright © 2018年 kejishengui. All rights reserved.
//

import UIKit


class homeViewModel: NSObject {
    lazy var homeModelsArray : [homeModel] = [homeModel]()
}

extension homeViewModel{
    
    func loadHomeViewData(finishedCallback : @escaping () -> ()){
        
        NetworkTools.requestData(URLString: "http://c.m.163.com/nc/article/list/T1348649079062/0-20.html", type:.get) { (result:Any) in
            
            // 1. 获取的数据
            guard let resultDict = result as? [String : Any] else { return }
            // 转换为一个数组里面包含数组的数组
            guard let dataArray = resultDict["T1348649079062"] as? [[String : Any]] else { return }
            
            // 2. 字典转模型
            for dic in dataArray{
              self.homeModelsArray.append(homeModel.init(dict: dic))
            }
            
            // 这里只需要回调一下就可以了，因为所有的数据 已经在viewMode 里面存储了
            finishedCallback()
            
        }
        
    }
    
    
    
    
    
}













