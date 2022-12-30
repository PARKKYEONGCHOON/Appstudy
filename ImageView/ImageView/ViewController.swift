//
//  ViewController.swift
//  ImageView
//
//  Created by 박경춘 on 2022/12/30.
//

import UIKit

class ViewController: UIViewController {
    
    var isZomm = false
    var imgOn: UIImage?
    var imgOff: UIImage?
    
    
    @IBOutlet var btnResize: UIButton!
    @IBOutlet var imgVIew: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        
        imgVIew.image = imgOn
        
        
        
    }

    @IBAction func btnResizeImage(_ sender: UIButton) {
        
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        
        if(isZomm)
        {
            newWidth = imgVIew.frame.width/scale
            newHeight = imgVIew.frame.height/scale
            btnResize.setTitle("확대", for: .normal)
            
        }
        else
        {
            newWidth = imgVIew.frame.width*scale
            newHeight = imgVIew.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
            
        }
        
        
        imgVIew.frame.size = CGSize(width: newWidth, height: newHeight)
        isZomm = !isZomm
        
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        
        if sender.isOn
        {
            imgVIew.image = imgOn
        }
        else
        {
            imgVIew.image = imgOff
        }
    }
}

