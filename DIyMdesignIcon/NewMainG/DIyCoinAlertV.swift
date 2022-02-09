//
//  DIyCoinAlertV.swift
//  DIyMdesignIcon
//
//  Created by Joe on 2022/1/11.
//

import UIKit

class DIyCoinAlertV: UIView {
    
    var backBtnClickBlock: (()->Void)?
    var okBtnClickBlock: (()->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func backBtnClick(sender: UIButton) {
        backBtnClickBlock?()
    }
    
    func setupView() {
        backgroundColor = UIColor.clear
//        //
        var blurEffect = UIBlurEffect(style: .dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.frame
        addSubview(blurEffectView)
        blurEffectView.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }
//
        //
        let bgBtn = UIButton(type: .custom)
        bgBtn
            .image(UIImage(named: ""))
            .adhere(toSuperview: self)
        bgBtn.addTarget(self, action: #selector(backBtnClick(sender:)), for: .touchUpInside)
        bgBtn.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }
        
        //
        let contentV = UIView()
            .backgroundColor(UIColor(hexString: "#282F33")!)
            .adhere(toSuperview: self)
        contentV.layer.cornerRadius = 24
        contentV.layer.masksToBounds = true
//        contentV.layer.shadowColor = UIColor.lightGray.withAlphaComponent(0.6).cgColor
//        contentV.layer.shadowOffset = CGSize(width: 0, height: 0)
//        contentV.layer.shadowRadius = 3
//        contentV.layer.shadowOpacity = 0.8
//        contentV.layer.borderWidth = 2
//        contentV.layer.borderColor = UIColor.black.cgColor
        contentV.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(UIScreen.width - 32 * 2)
            $0.height.equalTo(356)
            $0.centerY.equalToSuperview().offset(-10)
        }
        
        //
         
        let coinImgV = UIImageView()
            .image("store_diamond_big")
            .contentMode(.scaleAspectFit)
            .adhere(toSuperview: self)
        coinImgV.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(contentV.snp.top).offset(0)
            $0.width.equalTo(96)
            $0.height.equalTo(96)
        }
        
        //
        let infoLabel = UILabel()
        infoLabel.text("This is a paid\nitem")
            .textAlignment(.center)
            .numberOfLines(0)
            .fontName(28, "GillSans-Bold")
            .color(UIColor(hexString: "#FFFFFF")!)
            .adhere(toSuperview: contentV)
        infoLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(coinImgV.snp.bottom).offset(24)
            $0.left.equalTo(32)
            $0.height.greaterThanOrEqualTo(80)
        }
        //
        let titLab = UILabel()
            .text("\(DIynymCoinManagr.default.coinCostCount) coins need to be deducted to save. Do you confirm the save?")
            .textAlignment(.center)
            .numberOfLines(0)
            .fontName(20, "GillSans-Light")
            .color(UIColor(hexString: "#FFFFFF")!.withAlphaComponent(0.5))
            .adhere(toSuperview: contentV)
        
        titLab.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(infoLabel.snp.bottom).offset(8)
            $0.left.equalTo(32)
            $0.height.greaterThanOrEqualTo(60)
        }
        
        //
//        let contentBgImgV = UIImageView()
//        contentBgImgV.image("popup_pro")
//            .adhere(toSuperview: contentV)
//        contentBgImgV.snp.makeConstraints {
//            $0.left.right.top.bottom.equalToSuperview()
//        }
        
//        //
//
//        let titLab2 = UILabel()
//            .text("Using paid item will cost \(LPymCoinManagr.default.coinCostCount) coins.")
//            .textAlignment(.center)
//            .numberOfLines(0)
//            .fontName(16, "AvenirNext-Regular")
//            .color(UIColor(hexString: "#454D3D")!.withAlphaComponent(0.6))
//            .adhere(toSuperview: contentV)
//
//        titLab2.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.top.equalTo(titLab.snp.bottom).offset(10)
//            $0.left.equalToSuperview().offset(50)
//            $0.height.greaterThanOrEqualTo(1)
//        }
        
        //AvenirNext-DemiBold
        
        ///
        
        
        //
        let cancelBtn = UIButton()
        cancelBtn
            .image(UIImage(named: "pament_close"))
            .adhere(toSuperview: self)
        cancelBtn.snp.makeConstraints {
            $0.centerX.equalTo(contentV.snp.centerX)
            $0.top.equalTo(contentV.snp.bottom).offset(24)
            $0.width.equalTo(48)
            $0.height.equalTo(48)
        }
        
        cancelBtn.addTarget(self, action: #selector(backBtnClick(sender: )), for: .touchUpInside)
        //
        let okBtn = UIButton()
        okBtn
            .backgroundColor(UIColor(hexString: "#FFDC4D")!)
            .titleColor(UIColor.black)
            .title("Yes")
            .font(24, "GillSans-SemiBold")
            .adhere(toSuperview: contentV)
        okBtn.snp.makeConstraints {
            $0.centerX.equalTo(contentV.snp.centerX)
            $0.bottom.equalTo(contentV.snp.bottom).offset(-32)
            $0.width.equalTo(162)
            $0.height.equalTo(64)
        }
        okBtn.layer.cornerRadius = 64/2
        okBtn.addTarget(self, action: #selector(okBtnClick(sender: )), for: .touchUpInside)
        //
    }
    @objc func okBtnClick(sender: UIButton) {
        okBtnClickBlock?()
    }
  }
