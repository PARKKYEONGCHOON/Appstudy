//
//  ViewController.swift
//  AlramWatch
//
//  Created by 박경춘 on 2023/01/06.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var AlramTIme = ""
    var CurrentTime = ""
    var sw = false
    
    @IBOutlet var lbCurrentTime: UILabel!
    @IBOutlet var lbSelectTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        let datePickerView = sender
        let formatter = DateFormatter()
        let formatter2 = DateFormatter()
        
        formatter.dateFormat = "yyyy-mm-dd HH:mm:ss EEE"
        formatter2.dateFormat = "hh:mm aaa"
        
        AlramTIme = formatter2.string(from: datePickerView.date)
        lbSelectTime.text = "선택 : " + formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
        
        let date = NSDate()
        let formatter = DateFormatter()
        let formatter2 = DateFormatter()
        
        
        formatter.dateFormat = "yyyy-mm-dd HH:mm:ss EEE"
        formatter2.dateFormat = "hh:mm aaa"
        
        CurrentTime = formatter2.string(from: date as Date)
        lbCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
        
        if (AlramTIme == CurrentTime)
        {
            if(!sw)
            {
                sw = true
                let Alert = UIAlertController(title: "Alram", message: "Time!!!", preferredStyle: UIAlertController.Style.alert)
                
                let AlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                
                Alert.addAction(AlertAction)
                present(Alert, animated: true, completion: nil)
            }
            
        }
        else
        {
            sw = false
        }
        
        
    }
}

