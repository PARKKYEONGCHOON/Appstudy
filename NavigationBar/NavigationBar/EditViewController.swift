//
//  EditViewController.swift
//  NavigationBar
//
//  Created by 박경춘 on 2023/01/10.
//

import UIKit




protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didZoomInDone(_ controller: EditViewController, ZoomIn: Bool)
}

class EditViewController: UIViewController {

    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate : EditDelegate?
    var isOn = false
    var ZoomIn = false
    
    @IBOutlet var btnZoom: UIButton!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swIsOn: UISwitch!
    @IBOutlet var lblway: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblway.text = textWayValue
        txMessage.text = textMessage
        swIsOn.isOn = isOn
        
        
        if ZoomIn {
            btnZoom.setTitle("축소", for: .normal)
        }
        else {
            btnZoom.setTitle("확대", for: .normal)
        }
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didZoomInDone(self, ZoomIn: ZoomIn)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        }
        else
        {
            isOn = false
        }
    }
    @IBAction func btnZoom(_ sender: UIButton) {
        
        if ZoomIn{
            ZoomIn = false
            sender.setTitle("확대", for: .normal)
        }
        else
        {
            ZoomIn = true
            sender.setTitle("축소", for: .normal)
        }
        
        
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
