//
//  JFImage.swift
//  BaseFrame_Swift
//
//  Created by zx on 2018/12/20.
//  Copyright © 2018 zx. All rights reserved.
//

import Foundation

extension UIImage {
    //颜色创建图片
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
