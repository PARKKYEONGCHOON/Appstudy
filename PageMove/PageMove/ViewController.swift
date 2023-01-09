//
//  ViewController.swift
//  PageMove
//
//  Created by 박경춘 on 2023/01/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pageCon: UIPageControl!
    @IBOutlet var lblPage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageCon.numberOfPages = 10
        pageCon.currentPage = 0
        pageCon.pageIndicatorTintColor = UIColor.green
        pageCon.currentPageIndicatorTintColor = UIColor.red
        
        lblPage.text = String(pageCon.currentPage + 1)
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        
        lblPage.text = String(pageCon.currentPage + 1)
        
    }
    
}

