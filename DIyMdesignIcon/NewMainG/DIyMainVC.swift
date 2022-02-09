//
//  DIyMainVC.swift
//  DIyMdesignIcon
//
//  Created by Joe on 2022/1/11.
//

import UIKit

class DIyMainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AFlyerLibManage.event_LaunchApp()
        setupView()
        showAPLoginVC()
    }
    
    func showAPLoginVC() {
        if let _ = LoginManage.currentLoginUser() {
            // login
        } else {
            let logVc = ApLoginVC()
            self.navigationController?.pushViewController(logVc, animated: true)
        }
        
    }
    
    func setupView() {
        view.backgroundColor(.white)
        //
        let bottomBgImgV = UIImageView()
        bottomBgImgV.adhere(toSuperview: view)
            .image("homepage_bg")
            .contentMode(.scaleAspectFit)
        bottomBgImgV.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-(312/375 * UIScreen.width))
        }
        //
        let bottomMaskV = UIView()
        bottomMaskV.backgroundColor(UIColor(hexString: "#3D98E7")!)
            .adhere(toSuperview: view)
        bottomMaskV.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        
        //
        let coverImgV = UIImageView()
        coverImgV.image("homepage_img")
            .contentMode(.scaleAspectFill)
            .adhere(toSuperview: view)
        coverImgV.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(bottomBgImgV.snp.top).offset(70)
        }
        
        
        //
        let doneBtn = UIButton()
        doneBtn.backgroundColor(.black)
            .title("Let’s Do it")
            .font(24, "GillSans")
            .adhere(toSuperview: view)
        doneBtn.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-40)
            $0.left.equalTo(32)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            $0.height.equalTo(64)
        }
        doneBtn.layer.cornerRadius = 64/2
        doneBtn.addTarget(self, action: #selector(doneBtnClick(sender: )), for: .touchUpInside)
        
        //
        let settingBtn = UIButton()
        settingBtn
            .image(UIImage(named: "homepage_setting"))
            .adhere(toSuperview: view)
        settingBtn.snp.makeConstraints {
            $0.centerY.equalTo(doneBtn.snp.centerY)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-32)
            $0.height.width.equalTo(48)
        }
        settingBtn.addTarget(self, action: #selector(settingBtnClick(sender:)), for: .touchUpInside)
        //
        let storeBtn = UIButton()
        storeBtn
            .image(UIImage(named: "homepage_store"))
            .adhere(toSuperview: view)
        storeBtn.snp.makeConstraints {
            $0.centerY.equalTo(doneBtn.snp.centerY)
            $0.right.equalTo(settingBtn.snp.left).offset(-16)
            $0.height.width.equalTo(48)
        }
        storeBtn.addTarget(self, action: #selector(storeBtnClick(sender: )), for: .touchUpInside)
        
        //
        let titlLabel = UILabel()
        titlLabel.color(.white)
            .fontName(36, "GillSans-Bold")
            .text("Make Awesome\nIcons")
            .numberOfLines(2)
            .adhere(toSuperview: view)
        titlLabel.snp.makeConstraints {
            $0.left.equalTo(32)
            $0.bottom.equalTo(doneBtn.snp.top).offset(-24)
            $0.width.greaterThanOrEqualTo(1)
            $0.height.greaterThanOrEqualTo(1)
        }
        
    }
    
    @objc func settingBtnClick(sender: UIButton) {
        self.navigationController?.pushViewController(HPymSeettingVC(), animated: true)
    }
    
    @objc func storeBtnClick(sender: UIButton) {
        self.navigationController?.pushViewController(DIyStoreVC(), animated: true)
    }

    @objc func doneBtnClick(sender: UIButton) {
        self.navigationController?.pushViewController(DIyEditVC(), animated: true)
    }
    
}
