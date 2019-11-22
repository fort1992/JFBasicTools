//
//  JFFont.swift
//  BaseFrame_Swift
//
//  Created by zx on 2018/9/7.
//  Copyright © 2018年 zx. All rights reserved.
//

import UIKit

// 常规字体
func fontSize(_ size: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: adaptW(size))
}

// 加粗字体
func boldfontSize(_ size: CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: adaptW(size))
}
