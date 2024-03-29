//
//  BeerListCell.swift
//  Brewery
//
//  Created by 박경춘 on 2023/03/21.
//

import UIKit
import SnapKit
import Kingfisher

class BeerListCell: UITableViewCell {
    let beerimageView = UIImageView()
    let nameLabel = UILabel()
    let taglineLabel = UILabel()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [beerimageView, nameLabel, taglineLabel].forEach {
            contentView.addSubview($0)
        }
        
        beerimageView.contentMode = .scaleAspectFit
        
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.numberOfLines = 2
        
        taglineLabel.font = .systemFont(ofSize: 14, weight: .light)
        taglineLabel.textColor = .systemBlue
        taglineLabel.numberOfLines = 0
        
        beerimageView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
            $0.width.equalTo(80)
            $0.height.equalTo(120)
        }
        
        nameLabel.snp.makeConstraints{
            $0.leading.equalTo(beerimageView.snp.trailing).offset(10)
            $0.bottom.equalTo(beerimageView.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        taglineLabel.snp.makeConstraints{
            $0.leading.trailing.equalTo(nameLabel)
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
        
    }
    
    func configure(with beer: Beer) {
        let imageURL = URL(string: beer.imageURL ?? "")
        beerimageView.kf.setImage(with: imageURL, placeholder: UIImage(systemName: "mug.fill"))
        nameLabel.text = beer.name ?? "이름 없는 맥주"
        taglineLabel.text = beer.tagline
        
        accessoryType = .disclosureIndicator
        selectionStyle = .none
        
    }
    
}
