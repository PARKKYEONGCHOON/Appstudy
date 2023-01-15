//
//  ViewController.swift
//  CameraPhotoLibrary
//
//  Created by 박경춘 on 2023/01/15.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var imgView: UIImageView!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    var videoURl: URL!
    var flagImageSave = false
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        if mediaType.isEqual(to: "public.image" as String) {
            captureImage = info[UIImagePickerController.InfoKey.originalImage]
            as? UIImage
            
            if flagImageSave {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            
            imgView.image = captureImage
        }
        else if mediaType.isEqual(to: "public.movie" as String){
            if flagImageSave{
                videoURl = (info[UIImagePickerController.InfoKey.mediaURL] as! URL)
                
                UISaveVideoAtPathToSavedPhotosAlbum(videoURl.relativePath, self, nil, nil)
            }
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true,completion: nil)
    }
    
    func myAlert(_ title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(action)
        
        self.present(alert,animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            myAlert("Camera inaccessable", message: "Cannot Access the Camera")
        }
    }
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
        else{
            myAlert("Photo album inaccessable", message: "Cannot Access the photo album")
        }
    }
    @IBAction func btnRecordVideoFromCamera(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = ["public.movie"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
        else{
            myAlert("Camera inaccessable", message: "Cannot Access the Camera")
        }
    }
    @IBAction func btnLoadVideoFromLibrary(_ sender: UIButton) {
        
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.movie"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
        else{
            myAlert("Photo album inaccessable", message: "Cannot Access the the photo album")
        }
    }
    

}

