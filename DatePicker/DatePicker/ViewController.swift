//
//  ViewController.swift
//  DatePicker
//
//  Created by 박경춘 on 2022/12/30.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    var currentTime = ""
    var selectTIme = ""
    
    @IBOutlet var lblCurrentTime: UILabel!
    
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func changeDataPicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
        selectTIme = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime()
    {
        //lblCurrentTime.text = String(count)
        //count = count + 1
        
        let date = NSDate()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
        currentTime = formatter.string(from: date as Date)
        
        if(selectTIme == currentTime)
        {
            view.backgroundColor = UIColor.red
        }
        else
        {
            view.backgroundColor = UIColor.white
        }
        
        
        
    }
    

}

