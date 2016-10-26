//
//  ViewController.swift
//  photo
//
//  Created by Smile on 16/7/14.
//  Copyright © 2016年 Smile. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var imageview: UIImageView?
    var iamge: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        initview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        NSNotificationCenter.defaultCenter().postNotificationName("changeRotate", object: "0")
        var image = info[UIImagePickerControllerEditedImage] as! UIImage
        if picker.sourceType == UIImagePickerControllerSourceType.Camera {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
        let imageData = UIImagePNGRepresentation(image)
        saveImage(imageData!, imageName: "salesImageBig.jpg")
        saveImage(Compress().resetSizeOfImageData(image,maxSize: 30), imageName: "salesImageSmall.jpg")
        self.dismissViewControllerAnimated(true) {
            print(documentFolderPath("salesImageSmall.jpg"))
            image = UIImage(contentsOfFile: documentFolderPath("salesImageSmall.jpg"))!
            let data = UIImageJPEGRepresentation(image, 1.0)
            let base64 = data!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
            print(base64)
            self.imageview?.image = image
        }
    }

    func initview() {
        let btn1 = UIButton(type: UIButtonType.Custom)
        btn1.frame = CGRectMake((UIScreen.mainScreen().bounds.width - 100)/2, 100, 100, 80)
        btn1.setTitle("拍照", forState: UIControlState.Normal)
        btn1.backgroundColor = UIColor.blueColor()
        btn1.addTarget(self, action: #selector(ViewController.paizhao(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn1)
        let btn2 = UIButton(type: UIButtonType.Custom)
        btn2.frame = CGRectMake((UIScreen.mainScreen().bounds.width - 100)/2, 190, 100, 80)
        btn2.setTitle("从相册选取", forState: UIControlState.Normal)
        btn2.backgroundColor = UIColor.blueColor()
        btn2.addTarget(self, action: #selector(ViewController.xuanqu(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn2)
        imageview = UIImageView()
        imageview?.frame = CGRectMake((UIScreen.mainScreen().bounds.width - 300)/2, 280, 300, 300)
        self.view.addSubview(imageview!)
        
    }
    func paizhao(sender:UIButton) {
        NSNotificationCenter.defaultCenter().postNotificationName("changeRotate", object: "1")
        let load = Uploadphoto()
        load.imagePicker = UIImagePickerController()
        load.imagePicker.delegate = self
        load.pickImageFromCamera(self)
    }
    func xuanqu(sender:UIButton) {
        NSNotificationCenter.defaultCenter().postNotificationName("changeRotate", object: "1")
        let load = Uploadphoto()
        load.imagePicker = UIImagePickerController()
        load.imagePicker.delegate = self
        load.pickImageFromAlbum(self)
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        NSNotificationCenter.defaultCenter().postNotificationName("changeRotate", object: "0")
        self.dismissViewControllerAnimated(true) {
        }
        
    }
//    func saveImage(currentImage:UIImage,imageName:NSString){
//        var imageData:NSData = UIImageJPEGRepresentation(currentImage, 0.5)
//        var fullPath:String = NSHomeDirectory().stringByAppendingPathComponent("Documents").stringByAppendingPathComponent(imageName as String)
//        imageData.writeToFile(fullPath as String, atomically: false)
//        var fileURL = NSURL(fileURLWithPath: fullPath)     //开始上传操作    
//    }
//    /    上传照片    :param: url      上传url    :param: path  图片path
//    /    static func uploadImage(url:String,parameter:String,imagePath:NSURL ,requestDelegate:RequestDelegate)
//    {
//        Alamofire.upload(.POST,URLString: url,multipartFormData: { multipartFormData in
//            multipartFormData.appendBodyPart(fileURL: imagePath, name: "file")},            encodingCompletion: { encodingResult in
//                switch encodingResult {
//                case .Success(let upload, , ):upload.responseJSON { request, response, JSON, error in
//                    println(request)
//                        println(response)
//                        println(error)
//                        println(JSON)
//                    }
//                case .Failure(let encodingError):
//                    println(encodingError)
//                }
//        }        )
//    }
}

