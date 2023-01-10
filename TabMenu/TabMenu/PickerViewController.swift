//
//  ViewController.swift
//  PickerView
//
//  Created by 박경춘 on 2023/01/02.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    let Max_Array_Num = 8
    let Picker_View_Column = 1
    let Picker_View_Height:CGFloat = 80
    var ImageArray = [UIImage?]()
    var ImageFileName = ["1.JPG", "2.JPG", "3.JPG", "4.JPG", "5.JPG", "6.JPG", "7.JPG", "8.JPG"]
    
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0 ..< Max_Array_Num {
            let Image = UIImage(named: ImageFileName[i])
            ImageArray.append(Image)
            
            
        }
        
        lblImageFileName.text = ImageFileName[0]
        ImageView.image = ImageArray[0]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Picker_View_Column
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return Picker_View_Height
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ImageFileName.count
    }
    
    //func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //    return ImageFileName[row]
    //}
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let ImageView = UIImageView(image: ImageArray[row])
        ImageView.frame = CGRect(x: 0, y:0, width: 100, height: 150)
        
        return ImageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = ImageFileName[row]
        ImageView.image = ImageArray[row]
    }


}

