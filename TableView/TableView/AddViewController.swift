//
//  AddViewController.swift
//  TableView
//
//  Created by 박경춘 on 2023/01/14.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemImageFile.count
    }
    
    
    var imageArray = [UIImage?]()
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 50
    
    @IBOutlet var tfAddItem: UITextField!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0 ..< itemImageFile.count {
            let image = UIImage(named: itemImageFile[i])
            
            imageArray.append(image)
            
        }
        
        ImageView.image = imageArray[0]
        // Do any additional setup after loading the view.
    }
    
    func numOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    

    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemImageFile.append("clock.png")
        tfAddItem.text = ""
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x:0, y:0, width: 40, height: 40)
        
        return imageView
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int,
                    inComponent component: Int) {
        ImageView.image = imageArray[row]
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
