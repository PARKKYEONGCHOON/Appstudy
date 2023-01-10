//
//  ViewController.swift
//  NavigationBar
//
//  Created by 박경춘 on 2023/01/10.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    var ZoomIn = false

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var txMessage: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue : use Bar button"
        }
        
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.ZoomIn = ZoomIn
        editViewController.delegate = self
        
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        }
        else
        {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    func didZoomInDone(_ controller: EditViewController, ZoomIn: Bool) {
        
        let sacale = 2.0
        var newWidth : Double = 0.0
        var newHeight : Double = 0.0
        
        if ZoomIn {
            
            self.ZoomIn = false
            newWidth = imgView.frame.width/sacale
            newHeight = imgView.frame.height/sacale
        }
        else
        {
            self.ZoomIn = true
            newWidth = imgView.frame.width*sacale
            newHeight = imgView.frame.height*sacale
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
    }
    
    

}

