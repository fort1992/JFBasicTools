//
//  JFColor.swift
//  BaseFrame_Swift
//
//  Created by zx on 2018/9/7.
//  Copyright © 2018年 zx. All rights reserved.
//

import UIKit

let kWhite       = UIColor.white
let kRed         = UIColor.red
let kOrange      = UIColor.orange
let kBlack       = UIColor.black
let kGreen       = UIColor.green
let kPurple      = UIColor.purple
let kBlue        = UIColor.blue
let kLightGray   = UIColor.lightGray
let kClear      = UIColor.clear
let kYellow      = UIColor.yellow

// 半透明黑色
let kBackColor: UIColor = colorWithRGBA(red: 0, green: 0, blue: 0, alpha: 0.5)
func colorValue(_ value: CGFloat) -> CGFloat {
    return value / 255.0
}
/// UIColor,通过 RGBA数值设置颜色
///
/// - Parameters:
///   - red: 红色值
///   - green: 绿色值
///   - blue: 蓝色值
///   - alpha: 透明度
/// - Returns:  UIColor
func colorWithRGBA(red: CGFloat,green: CGFloat,blue: CGFloat,alpha: CGFloat) -> UIColor {
    return UIColor(red: colorValue(red),green: colorValue(green),blue: colorValue(blue),alpha: alpha)
}
/// 随机的颜色
func JF_randomColor() -> UIColor {
    let rarc = CGFloat(arc4random() % 256) / 255.0
    let garc = CGFloat(arc4random() % 256) / 255.0
    let barc = CGFloat(arc4random() % 256) / 255.0
    return UIColor(red: rarc, green: garc, blue: barc, alpha: 1.0)
}
