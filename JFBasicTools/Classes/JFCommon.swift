//
//  Common.swift
//  BaseFrame_Swift
//
//  Created by zx on 2018/9/7.
//  Copyright © 2018年 zx. All rights reserved.
//

import UIKit

let kScreenW = UIScreen.main.bounds.size.width
let kScreenH = UIScreen.main.bounds.size.height

// 状态栏高度
let kStatuHeight: CGFloat = 20

// 导航栏高度
let kNavigationBarHeight: CGFloat =  isIPhoneXSeries().2 + (isIPhoneXSeries().0 == true ? 24 + 20 : 20)
// TabBar高度
let kTabBarHeight: CGFloat = 49 + isIPhoneXSeries().1 //一般列表页面不去适配，底部有按钮的界面要适配

// 宽度比
let kWidthRatio = kScreenW / 375.0
// 高度比
let kHeightRatio = isIPhoneXSeries().0 == true ? 667.0 / 667.0 : kScreenH / 667.0
//默认图片
let defaulImage = "defaultPicture"
// 自适应
//func Adapt(_ value : CGFloat) -> CGFloat {
//
//    return adaptW(value)
//}

// 自适应宽度
func adaptW(_ value: CGFloat) -> CGFloat {
    return UIDevice.current.model == "iPad" ? adaptH(value) : ceil(value) * kWidthRatio
}

// 自适应高度
func adaptH(_ value: CGFloat) -> CGFloat {
    return ceil(value) * kHeightRatio
}
//适配iphone XR / iphgone XS Max 返回的 safeBottom是底部安全区高度 safeTop是顶部安全区高度
let isIPhoneXSeries = {() -> (Bool,CGFloat,CGFloat) in
    var iPhoneXSeries: Bool = false
    var safeBottom: CGFloat = 0
    var safeTop: CGFloat = 44 // 默认是44
    if UIDevice.current.userInterfaceIdiom != UIUserInterfaceIdiom.phone {
        return (iPhoneXSeries,safeBottom,safeTop)
    }
    if #available(iOS 11.0, *) {
        if (UIApplication.shared.delegate?.window??.safeAreaInsets.bottom)! > CGFloat(0.0) && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone {
            iPhoneXSeries = true
            safeBottom = (UIApplication.shared.delegate?.window??.safeAreaInsets.bottom)!
            safeTop = (UIApplication.shared.delegate?.window??.safeAreaInsets.top)!
        }
    }
    return (iPhoneXSeries,safeBottom,safeTop)
}
enum NavTypeEnum: Int {
    case onlyTitle = 0 // 只有标题
    case rightTitle = 1 // 有右侧标题和 右侧是图片
    case leftTitle = 2 // 左侧和右侧都是图片
    case all = 3 // 所有
}
//---会议列表类型
enum MeetingListTypeString: String {
    case appointment = "PREDETERMINE" //"预约"
    case hand = "PROCEED"//"进行中"
    case ended = "FINISHED" //"已结束"
    case cancelled = "CANCELED" //"已取消"
    case carried = "NOPROCEED" //"未进行"
}
//Switch 倍数缩放
let switchMultiple: CGFloat = UIDevice.current.model == "iPad" ? 0.75 : 0.5
func jf_setUpGradientLayer (view: UIView,frame: CGRect,color: [CGColor],corneradiu: CGFloat? = 0) {
    let gradientLayer: CAGradientLayer = CAGradientLayer()
    gradientLayer.colors = color
    //(这里的起始和终止位置就是按照坐标系,四个角分别是左上(0,0),左下(0,1),右上(1,0),右下(1,1))
    //渲染的起始位置
    gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
    //渲染的终止位置
    gradientLayer.endPoint = CGPoint.init(x: 1, y: 0)
    //设置frame和插入view的layer
    gradientLayer.frame = frame
    gradientLayer.cornerRadius = corneradiu!
    view.layer.insertSublayer(gradientLayer, at: 0)
}
//自定义提示框
public func alertDismiss(message: String?) {
    let messageSize = (message! as NSString).boundingRect(with: CGSize(width: kScreenW * 2 / 3, height: 100),options: NSStringDrawingOptions.usesLineFragmentOrigin,attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)],context: nil)
    var messageWidth = messageSize.width + 20
    var messageHeight = messageSize.height
    if messageWidth < 60 {
        messageWidth = 60
    }
    if messageHeight < 50 {
        messageHeight = 50
    }
    let tipView = UIView.init()
    tipView.layer.cornerRadius = 5
    tipView.clipsToBounds = true
    tipView.backgroundColor = UIColor.black
    UIApplication.shared.keyWindow?.addSubview(tipView)
    tipView.snp.makeConstraints { (make) in
        make.width.equalTo(messageWidth)
        make.height.equalTo(messageHeight)
        make.centerY.equalTo((UIApplication.shared.keyWindow?.snp.centerY)!)
        make.centerX.equalTo((UIApplication.shared.keyWindow?.snp.centerX)!)
    }
    let labelView = UILabel.init()
    tipView.addSubview(labelView)
    labelView.snp.makeConstraints { (make) in
        make.edges.equalToSuperview()
    }
    labelView.text = message
    labelView.textColor = UIColor.white
    labelView.font = UIFont.systemFont(ofSize: 14)
    labelView.textAlignment = NSTextAlignment.center
    labelView.numberOfLines = 0
    UIView.animate(withDuration: 1.5, animations: {
        tipView.alpha = 0.0
    }) { (_) in
        tipView.removeFromSuperview()
    }
}
/**
 判断是否第一次启动
 
 - returns:
 */
public func didFinishLaunchingOnce() -> Bool {
    let defaults = UserDefaults.standard
    if defaults.string(forKey: "hasAppBeenLaunchedBefore") != nil {
        return true
    } else {
        defaults.set(true, forKey: "hasAppBeenLaunchedBefore")
        return false
    }
}
