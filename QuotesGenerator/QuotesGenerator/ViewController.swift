//
//  ViewController.swift
//  QuotesGenerator
//
//  Created by 박경춘 on 2023/03/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    let quotes = [
        Quote(content: "편견이란 실효성이 없는 의견이다", name: "암브로스 빌"),
        Quote(content: "분노는 바보들의 가슴속에서만 살아간다", name: "아인슈타인"),
        Quote(content: "나는 나 자신을 빼 놓고는 모두 안다", name: "비용")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tabQuoteGenerator(_ sender: UIButton) {
        let random = Int(arc4random_uniform(3))
        let quote = quotes[random]
        self.quoteLabel.text = quote.content
        self.nameLabel.text = quote.name
        
    }
    
}

