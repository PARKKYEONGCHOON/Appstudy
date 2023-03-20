//
//  NoticeViewController.swift
//  notice
//
//  Created by 박경춘 on 2023/03/20.
//

import UIKit

class NoticeViewController: UIViewController {
    
    var noticeContents: (title: String, detail: String, date: String)?

    @IBOutlet var noticeView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        
        noticeView.layer.cornerRadius = 6
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        guard let noticeContents = noticeContents else { return }
        
        titleLabel.text = noticeContents.title
        detailLabel.text = noticeContents.detail
        dateLabel.text = noticeContents.date
        
    }
    
    @IBAction func okButton(_ sender: UIButton) {
        
        self.dismiss(animated: true,completion: nil)
        
    }
    
}
