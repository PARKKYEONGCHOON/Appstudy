//
//  AddAlertViewController.swift
//  WaterDrink
//
//  Created by 박경춘 on 2023/03/20.
//

import UIKit

class AddAlertViewController: UIViewController {
    
    var pickedDate: ((_ date: Date) -> Void)?
    
    @IBOutlet var datePicker: UIDatePicker!
    
    
    @IBAction func dismissButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true,completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        pickedDate?(datePicker.date)
        self.dismiss(animated: true,completion: nil)
    }
}
