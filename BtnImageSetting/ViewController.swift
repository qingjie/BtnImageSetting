//
//  ViewController.swift
//  BtnImageSetting
//
//  Created by qingjiezhao on 7/26/15.
//  Copyright (c) 2015 qingjiezhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnTapped(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            
            
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.allowsEditing = true
            if UIImagePickerController.isCameraDeviceAvailable(UIImagePickerControllerCameraDevice.Front){
                picker.cameraDevice = UIImagePickerControllerCameraDevice.Front
            }
            
            picker.cameraFlashMode = UIImagePickerControllerCameraFlashMode.On
            
            self.presentViewController(picker, animated: true, completion: { () -> Void in
            
                
                
            })
            
        }else{
            println("can not find camera")
        }
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    
        let gotImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        btn.setBackgroundImage(gotImage, forState: .Normal)
        println(info)
        self.dismissViewControllerAnimated(true, completion: nil)
    
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        println("Cancel")
    }
    

}

