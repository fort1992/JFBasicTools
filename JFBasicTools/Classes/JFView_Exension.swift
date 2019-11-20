//
//  JFView_Exension.swift
//  BaseFrame_Swift
//
//  Created by zx on 2018/9/7.
//  Copyright © 2018年 zx. All rights reserved.
//

import UIKit
import SnapKit
import Then

extension UIView {
    /// 快速创建 View 并使用 SnapKit 布局
    ///
    /// - Parameters:
    ///   - bgClor: View 的背景颜色
    ///   - supView: 父视图
    ///   - closure: 约束
    /// - Returns:  View
    class func jf_createView(bgClor: UIColor,supView: UIView?,closure:(_ make: ConstraintMaker) -> Void) -> UIView {
        let view = UIView().then {
            $0.backgroundColor = bgClor
            if supView != nil {
                supView?.addSubview($0)
                $0.snp.makeConstraints { (make) in
                    closure(make)
                }
            }
        }
        return view
    }
    /// 快速创建一个 UIImageView,可以设置 imageName,contentMode,父视图,约束
    ///
    /// - Parameters:
    ///   - imageName: 图片名称
    ///   - contentMode: 填充模式
    ///   - supView: 父视图
    ///   - closure: 约束
    /// - Returns:  UIImageView
    class func jf_createImageView(imageName: String?,contentMode: UIViewContentMode? = nil,supView: UIView? ,closure:(_ make: ConstraintMaker) -> Void) -> UIImageView {
        let imageV = UIImageView().then {
            if imageName != nil {
                $0.image = UIImage(named: imageName!)
            }
            if contentMode != nil {
                $0.contentMode = contentMode!
            }
            if supView != nil {
                supView?.addSubview($0)
                $0.snp.makeConstraints { (make) in
                    closure(make)
                }
            }
        }
        return imageV
    }
    /// 快速创建 UIButton,设置标题,图片,父视图,约束
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - titleStatu: 标题状态模式
    ///   - imageName: 图片名
    ///   - imageStatu: 图片状态模式
    ///   - supView: 父视图
    ///   - closure: 约束
    /// - Returns:  UIButton
    class func jf_createButton(title: String?,titleStatu: UIControlState?,imageName: String?,imageStatu: UIControlState?,supView: UIView?,closure: (_ make: ConstraintMaker) -> Void) -> UIButton {
        let btn = UIButton().then {
            if title != nil {
                $0.setTitle(title, for: .normal)
            }
            if title != nil && titleStatu != nil {
                $0.setTitle(title, for: titleStatu!)
            }
            if imageName != nil {
                $0.setImage(UIImage(named: imageName!), for: .normal)
            }
            if imageName != nil && imageStatu != nil {
                $0.setImage(UIImage(named: imageName!), for: imageStatu!)
            }
            if supView != nil {
                supView?.addSubview($0)
                $0.snp.makeConstraints { (make) in
                    closure(make)
                }
            }
        }
        return btn
    }
    /// 快速创建 Label,设置文本, 文本颜色,Font,文本位置,父视图,约束
    ///
    /// - Parameters:
    ///   - text: 文本
    ///   - textColor: 文本颜色
    ///   - font: 字体大小
    ///   - textAlignment: 文本位置
    ///   - supView: 父视图
    ///   - closure: 越是
    /// - Returns:  UILabel
    class func jf_createLabel(text: String? , textColor: UIColor?, font: UIFont?, textAlignment: NSTextAlignment = .left,supView: UIView? ,closure: (_ make: ConstraintMaker) -> Void) -> UILabel {
        let label = UILabel().then {
            $0.text = text
            if textColor != nil { $0.textColor = textColor }
            if font != nil { $0.font = font }
            $0.textAlignment = textAlignment
            if supView != nil {
                supView?.addSubview($0)
                $0.snp.makeConstraints { (make) in
                    closure(make)
                }
            }
        }
        return label
    }
    /// 快速创建 UITextField,设置文本, 文本颜色,Font,文本位置,父视图,约束
    ///
    /// - Parameters:
    ///   - text: 文本
    ///   - textColor: 文本颜色
    ///   - font: 字体大小
    ///   - textAlignment: 文本位置
    ///   - supView: 父视图
    ///   - closure: 越是
    /// - Returns:  UITextField
    class func jf_createTextField(placeholder: String?,font: UIFont?,textAlignment: NSTextAlignment = .left,keyboard: UIKeyboardType,supView: UIView?,closure: (_ make: ConstraintMaker) -> Void) -> UITextField {
        let textField = UITextField().then {
            $0.placeholder = placeholder
            $0.font = font
            $0.textAlignment = textAlignment
            $0.keyboardType = keyboard
            if supView != nil {
                supView?.addSubview($0)
                $0.snp.makeConstraints { (make) in
                    closure(make)
                }
            }
        }
        return textField
    }
    ///快速创建 Slider视图
    /// minimumValue ： 最小值
    ///maximumValue ： 最大值
    ///value ： 默认值
    ///supView ： 父视图
    ///closure ： 约束
    class func jf_createSlider(minimumValue: Float,maximumValue: Float,value: Float,supView: UIView?,closure:(_ make: ConstraintMaker) -> Void) -> UISlider {
        let slider = UISlider().then {
            $0.minimumValue = minimumValue
            $0.maximumValue = maximumValue
            $0.setValue(value, animated: true)//
            if supView != nil {
                supView?.addSubview($0)
                $0.snp.makeConstraints { (make) in
                    closure(make)
                }
            }
        }
        return slider
    }
    /// 部分圆角
    ///
    /// - Parameters:
    ///   - corners: 需要实现为圆角的角，可传入多个
    ///   - radii: 圆角半径
    func corner(byRoundingCorners corners: UIRectCorner, radii: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
}
