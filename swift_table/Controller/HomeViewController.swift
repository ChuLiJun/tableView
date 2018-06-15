//
//  HomeViewController.swift
//  test_swift_tableView
//
//  Created by keji shengui on 2018/6/14.
//  Copyright © 2018年 kejishengui. All rights reserved.
//

import UIKit

private let tableCellID = "tableCellID"
private let tableRowHeight:CGFloat = 100
class HomeViewController: UIViewController {
    
    // MARK: 懒加载属性
    fileprivate lazy var homeVM : homeViewModel = homeViewModel()
    fileprivate lazy var  tableView :UITableView? = {
        
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        tableView.dataSource = self;
        tableView.rowHeight = tableRowHeight
        
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: tableCellID)
        
        return tableView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //1. 添加 tableView
        view.addSubview(tableView!)
        
        //2. 请求数据
        loadData()
    }
}

// 请求数据
extension HomeViewController{
    fileprivate func loadData() {
        homeVM.loadHomeViewData {
            self.tableView?.reloadData()
        }
    }
}


extension HomeViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(homeVM.homeModelsArray.count)
        
        return homeVM.homeModelsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCell(withIdentifier: tableCellID, for: indexPath) as! HomeTableViewCell
        
        cell.cellModel = homeVM.homeModelsArray[indexPath.row]
        
        return cell
    }
    
}





















































