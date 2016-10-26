//
//  Uploadphoto.swift
//  photo
//
//  Created by Smile on 16/7/14.
//  Copyright © 2016年 Smile. All rights reserved.
//

import UIKit

class Uploadphoto: NSObject {
    var imagePicker: UIImagePickerController!
    //从用户相册获取图片
    func pickImageFromAlbum(vc: UIViewController) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        imagePicker.allowsEditing = true
        vc.presentViewController(imagePicker, animated: true) {
        }
    }
    //拍照
    func pickImageFromCamera(vc: UIViewController) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        imagePicker.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        imagePicker.allowsEditing = true
        vc.presentViewController(imagePicker, animated: true) {
        }
    }
}
//储存
func saveImage(imageData: NSData, imageName: String) {
    let dir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
    let file = dir.stringByAppendingString("/"+imageName)
    imageData.writeToFile(file, atomically: true)
}
//获取沙盒路径
func documentFolderPath(imageName: String) -> String {
    let home = NSHomeDirectory() as NSString
    let home1 = home.stringByAppendingPathComponent("Documents") as NSString
    return home1.stringByAppendingPathComponent(imageName)
}



