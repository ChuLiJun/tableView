//
//  HomeTableViewCell.swift
//  test_swift_tableView
//
//  Created by keji shengui on 2018/6/14.
//  Copyright © 2018年 kejishengui. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit
fileprivate let KScreenW = UIScreen.main.bounds.width
fileprivate let KScreenH = UIScreen.main.bounds.height

class HomeTableViewCell: UITableViewCell {
    
    var cellModel : homeModel? {
        didSet {
            // 1.为 iconImageView 赋值
            let iconURL = URL(string: cellModel?.imgsrc ?? "")
            iconImageView!.kf.setImage(with: iconURL)
            
            // 2.为 titleLabel 赋值
            titleLabel?.text = cellModel?.title
            
            // 3.为 sourceLabel 赋值
            sourceLabel?.text = cellModel?.source
            
            // 4.为 replyCountLabel 赋值
            replyCountLabel?.text = "\(cellModel?.replyCount ?? 0)跟帖"
        }
    }
    
    
    var iconImageView: UIImageView?
    var titleLabel: UILabel?
    var sourceLabel: UILabel?
    var replyCountLabel: UILabel?
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconImageView = UIImageView()
        iconImageView?.backgroundColor = UIColor.red
        self.contentView.addSubview(iconImageView!)
        iconImageView?.snp.makeConstraints({ (make) in
            make.width.equalTo(100)         
            make.height.equalTo(80)
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
        })
        
        
        titleLabel = UILabel()
        titleLabel?.text = "俄罗斯的美女"
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
        titleLabel?.numberOfLines = 2
        self.contentView.addSubview(titleLabel!)
        titleLabel?.snp.makeConstraints({ (make) in
            make.height.equalTo(60)
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(iconImageView!.snp.right).offset(10)
             make.right.equalToSuperview().offset(-10)
        })
        
        sourceLabel = UILabel()
        sourceLabel?.text = "俄罗斯美女"
        sourceLabel?.font = UIFont.systemFont(ofSize: 14)
        self.contentView.addSubview(sourceLabel!)
        sourceLabel?.snp.makeConstraints({ (make) in
            make.height.equalTo(20)
            make.bottom.equalToSuperview().offset(-10)
            make.left.equalTo(iconImageView!.snp.right).offset(10)
            make.width.equalTo(80)
        })
        
        replyCountLabel = UILabel()
        replyCountLabel?.text = "666跟帖"
        replyCountLabel?.font = UIFont.systemFont(ofSize: 12)
        replyCountLabel?.textAlignment = .right
        self.contentView.addSubview(replyCountLabel!)
        replyCountLabel?.snp.makeConstraints({ (make) in
            make.height.equalTo(20)
            make.width.equalTo(80)
            make.bottom.equalToSuperview().offset(-10)
            make.right.equalToSuperview().offset(-10)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
