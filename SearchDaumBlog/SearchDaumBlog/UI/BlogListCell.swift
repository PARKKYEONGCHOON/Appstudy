//
//  BlogListCell.swift
//  SearchDaumBlog
//
//  Created by 박경춘 on 2023/03/26.
//

import UIKit
import SnapKit
import Kingfisher

class BlogListCell: UITableViewCell {
    let thumnailImageVIew = UIImageView()
    let nameLabel = UILabel()
    let titleLabel = UILabel()
    let datetimeLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        thumnailImageVIew.contentMode = .scaleAspectFit
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.numberOfLines = 2
        
        datetimeLabel.font = .systemFont(ofSize: 12, weight: .light)
        
        [thumnailImageVIew, nameLabel, titleLabel, datetimeLabel]
            .forEach {
                contentView.addSubview($0)
            }
        
        
        nameLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(8)
            $0.trailing.lessThanOrEqualTo(thumnailImageVIew.snp.leading).offset(-8)
        }
        
        thumnailImageVIew.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.top.trailing.bottom.equalToSuperview().inset(8)
            $0.width.height.equalTo(80)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.leading.equalTo(nameLabel)
            $0.trailing.equalTo(thumnailImageVIew.snp.leading).offset(-8)
            
        }
        
        datetimeLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(nameLabel)
            $0.trailing.equalTo(titleLabel)
            $0.bottom.equalTo(thumnailImageVIew)
        }
    }
    
    func setData(_ data: BlogListCellData) {
        thumnailImageVIew.kf.setImage(with: data.thumnailURL, placeholder: UIImage(systemName: "photo"))
        nameLabel.text = data.name
        titleLabel.text = data.title
        
        var datatime: String {
            let dateFormmatter = DateFormatter()
            dateFormmatter.dateFormat = "yyyy년 MM월 dd일"
            let contentDate = data.datetime ?? Date()
            
            return dateFormmatter.string(from: contentDate)
        }
        
        datetimeLabel.text = datatime
        
    }
    
}
