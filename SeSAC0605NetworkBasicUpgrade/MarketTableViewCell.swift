//
//  MarketTableViewCell.swift
//  SeSAC0605NetworkBasicUpgrade
//
//  Created by 최대성 on 6/5/24.
//

import UIKit
import SnapKit


class MarketTableViewCell: UITableViewCell {
    
    static let identifier = "MarketTableViewCell"
    let nameLabel = UILabel()
    

    // 변경되지 않는 정적인 데이터를 다룸 > awakeFromNib
    // NIB == XIB >> XIB가 없다면 이 코드는 실행이 안됨.
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide)
        }
        
        nameLabel.textColor = .brown
        nameLabel.font = .boldSystemFont(ofSize: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
