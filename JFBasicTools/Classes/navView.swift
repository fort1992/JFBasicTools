//
//  navView.swift
//  BaseFrame_Swift
//
//  Created by zx on 2018/12/18.
//  Copyright © 2018 zx. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

typealias NavactionBlock = (Int) -> Void // 0 左侧 1 右侧
class NavView: UIView {
    private lazy var disposeBag = DisposeBag()
    var bgView: UIView = UIView()
    private lazy var titleLabel: UILabel = UILabel()
    private lazy var leftTitleBtn: UIButton = UIButton()
    private lazy var rightTitleBtn: UIButton = UIButton()
    var actionBlock: NavactionBlock?
    func navActionBlock(block: NavactionBlock?) {
        self.actionBlock = block
    }
    /// nav配置UI
    ///
    /// - Parameters:
    ///   - frame: nav frame
    ///   - type: 类型
    ///   - title: 标题
    ///   - leftTitle: 左侧标题数组 第一个标题 第二个图片name
    ///   - rightTitle: 右侧标题数组 第一个标题 第二个图片name
    ///   - navBackColor: <#navBackColor description#>
    ///   - rightColor: 右侧颜色数组 第一个默认颜色 第二个高亮颜色
    ///   - leftColor: 左侧颜色数组 第一个默认颜色 第二个高亮颜色
    ///   - Size: 第一右侧size  第二个左侧size
    init(frame: CGRect,type: Int,title: String,leftTitle: [String],rightTitle: [String],navBackColor: UIColor,rightColor: [UIColor],leftColor: [UIColor],size: [CGSize]) {
        super.init(frame: frame)
        setAllView(type: type, title: title, leftTitle: leftTitle, rightTitle: rightTitle, navBackColor: navBackColor, rightColor: rightColor, leftColor: leftColor, size: size)
        clickAction() // 事件
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - 配置UI
extension NavView {
    private func setAllView(type: Int,title: String,leftTitle: [String],rightTitle: [String],navBackColor: UIColor,rightColor: [UIColor],leftColor: [UIColor],size: [CGSize]) {
        bgView = UIView.jf_createView(bgClor: navBackColor, supView: self, closure: { (make) in
            make.edges.equalToSuperview()
        })
        bgView.layer.shadowOffset = CGSize(width: 0, height: adaptH(1))
        bgView.layer.shadowOpacity = 1
        bgView.layer.shadowRadius = adaptW(3)
//        bgView.layer.borderWidth = 1
        titleLabel = UIView.jf_createLabel(text: title, textColor: kWhite, font: boldfontSize(17), textAlignment: .center, supView: self.bgView, closure: { (make) in
            make.height.equalTo(adaptH(16))
            make.width.equalTo(adaptW(230))
            make.bottom.equalTo(self.bgView.snp.bottom).offset(adaptH(-12))
            make.centerX.equalToSuperview()
        })
        switch type {
        case 0:
            break
        case 1: // 右侧标题和图片
            setRightView(rightTitle: rightTitle, rightColor: rightColor, size: size)
        case 2://左侧标题和图片
            setLeftView(leftTitle: leftTitle, leftColor: rightColor, size: size)
        case 3:
            setRightView(rightTitle: rightTitle, rightColor: rightColor, size: size)
            setLeftView(leftTitle: leftTitle, leftColor: rightColor, size: size)
        case 4:
            break
        default:
            break
        }
    }
    private func setRightView(rightTitle: [String],rightColor: [UIColor],size: [CGSize]) {
        rightTitleBtn = UIView.jf_createButton(title: rightTitle[0], titleStatu: .normal, imageName: rightTitle[1], imageStatu: .normal, supView: self.bgView, closure: { (make) in
            make.centerY.equalTo(self.titleLabel.snp.centerY)
            make.right.equalTo(adaptW(-15))
            make.width.equalTo(size[0].width)
            make.height.equalTo(size[0].height)
        })
        rightTitleBtn.setTitleColor(rightColor[0], for: .normal)
        rightTitleBtn.setTitleColor(rightColor[1], for: .highlighted)
    }
    private func setLeftView(leftTitle: [String],leftColor: [UIColor],size: [CGSize]) {
        leftTitleBtn = UIView.jf_createButton(title: leftTitle[0], titleStatu: .normal, imageName: leftTitle[1], imageStatu: .normal, supView: self.bgView, closure: { (make) in
            make.left.equalTo(adaptW(15))
            make.centerY.equalTo(self.titleLabel.snp.centerY)
            make.width.equalTo(size[1].width)
            make.height.equalTo(size[1].height)
        })
        leftTitleBtn.setTitleColor(leftColor[0], for: .normal)
        leftTitleBtn.setTitleColor(leftColor[1], for: .highlighted)
    }
}

// MARK: - action
extension NavView {
    private func clickAction() {
        rightTitleBtn.rx.controlEvent(.touchUpInside).subscribe(onNext: { [weak self] in
            self?.actionBlock!(1) //
        }).disposed(by: disposeBag)
        leftTitleBtn.rx.controlEvent(.touchUpInside).subscribe(onNext: { [weak self] in
            self?.actionBlock!(0)
        }).disposed(by: disposeBag)
    }
}
