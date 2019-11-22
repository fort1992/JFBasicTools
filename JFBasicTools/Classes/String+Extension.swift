//
//  String+Extension.swift
//  BaseFrame_Swift
//
//  Created by zx on 2018/9/7.
//  Copyright © 2018年 zx. All rights reserved.
//

import UIKit

extension String {
    /// 获取高度计算
    ///
    /// - Parameters:
    ///   - size: 矩形已知范围
    ///   - attributes: 文字属性
    /// - Returns: 高度
    public func heigh(_ size: CGSize, _ attributes: [NSAttributedStringKey: Any]?) -> CGFloat {
        let string = self as NSString
        let stringSize = string.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return stringSize.height
    }
    /// 获取宽度计算
    ///
    /// - Parameters:
    ///   - size: 矩形已知范围
    ///   - attributes: 文字属性
    /// - Returns: 宽度
    public func width(_ size: CGSize, _ attributes: [NSAttributedStringKey: Any]?) -> CGFloat {
        let string = self as NSString
        let stringSize = string.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return stringSize.width
    }
    //获取文本的长度
    func ga_widthForComment(fontSize: UIFont, height: CGFloat) -> CGFloat {
        let rect = NSString(string: self).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT),height: height), options: .usesLineFragmentOrigin,attributes: [NSAttributedStringKey.font: fontSize],context: nil)
        return ceil(rect.width)
    }
    //获取文本的高度
    func getNormalStrH(str: String, strFont: CGFloat, width: CGFloat) -> CGFloat {
        return getNormalStrSize(str: str, font: strFont, width: width, height: CGFloat.greatestFiniteMagnitude).height
    }
    private func getNormalStrSize(str: String? = nil, attriStr: NSMutableAttributedString? = nil, font: CGFloat, width: CGFloat, height: CGFloat) -> CGSize {
        if str != nil {
            let strSize = (str! as NSString).boundingRect(with: CGSize(width: width, height: height), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: fontSize(font)], context: nil).size
            return strSize
        }
        if attriStr != nil {
            let strSize = attriStr!.boundingRect(with: CGSize(width: width, height: height), options: .usesLineFragmentOrigin, context: nil).size
            return strSize
        }
        return CGSize.zero
    }
    //--
    func jwtDecode() -> [String: Any] {
        /**分割为数组*/
        let segments = components(separatedBy: ".")
        /**获取第二个元素Payload负载元素(有意义的key就在里面解析的)*/
        var base64String = segments[1]
        /** base64解码*/
        let requiredLength = (4 * ceil((Float)(base64String.count)/4.0))
        let nbrPaddings = Int(requiredLength) - base64String.count
        if nbrPaddings > 0 {
            let pading = "".padding(toLength: nbrPaddings,withPad: "=",startingAt: 0)
            base64String += pading
        }
        base64String = base64String.replacingOccurrences(of: "-",with: "+")
        base64String = base64String.replacingOccurrences(of: "_",with: "/")
        let decodeData = Data(base64Encoded: base64String,options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
        let decodeString = String.init(data: decodeData!,encoding: String.Encoding.utf8)
        /**转为字典*/
        let jsonDict: [String: Any]? = try? JSONSerialization.jsonObject(with: (decodeString?.data(using: String.Encoding.utf8))!,options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: Any]
        /**返回jwt */
        return jsonDict ?? [:]
    }
}
// 下标截取任意位置的便捷方法
extension String {
    var length: Int {
        return self.count
    }
    subscript (index: Int) -> String {
        return self[index ..< index + 1]
    }
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    subscript (rNew: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, rNew.lowerBound)), upper: min(length, max(0, rNew.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
//不包含后几个字符串的方法
//extension String {
//    func dropLast(_ nNew: Int = 1) -> String {
//        return String(characters.dropLast(nNew))
//    }
//    var dropLast: String {
//        return dropLast()
//    }
//}
