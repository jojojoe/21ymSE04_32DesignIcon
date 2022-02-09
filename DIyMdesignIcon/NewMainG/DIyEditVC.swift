//
//  DIyEditVC.swift
//  DIyMdesignIcon
//
//  Created by Joe on 2022/1/11.
//

import UIKit
import Photos

class DIyEditVC: UIViewController {

    let iconBtn = UIButton()
    let bgBtn = UIButton()
    let iconColorBtn = UIButton()
    let iconCollection = DIymIconCollection()
    let bgColorCollection = DIymColorCollection(frame: .zero, colorList: DICymDataManager.default.bgColorList)
    let iconColorCollection = DIymColorCollection(frame: .zero, colorList: DICymDataManager.default.iconColorList)
    let contentBgV = UIView()
    let iconBgV = UIView()
    let iconImgV = UIImageView()
    let cornerAdjustBgV = DIyCornerAdjustV()
    let coinAlertView = DIyCoinAlertV()
    var didLayoutOnce: Once = Once()
    
    var isVipIcon: Bool = false
    var isVipIconColor: Bool = false
    var isVipBgColor: Bool = false
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        didLayoutOnce.run {

            let width: CGFloat = UIScreen.width - 64 * 2
            let ox: CGFloat = (UIScreen.width - width) / 2
            let oy: CGFloat = (self.contentBgV.frame.maxY - self.contentBgV.frame.minY - width) / 2
            
            self.iconBgV.adhere(toSuperview: contentBgV)
            self.iconBgV.frame = CGRect(x: ox, y: oy, width: width, height: width)
            
            self.iconImgV.adhere(toSuperview: iconBgV)
            self.iconImgV.center = CGPoint(x: width/2, y: width/2)
            
//            let iconWidth: CGFloat = UIScreen.width - 64 * 2 - 50 * 2
//            self.iconImgV.bounds = CGRect(x: 0, y: 0, width: iconWidth, height: iconWidth)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupCoinAlertView()
        
        
        //
        iconBtn.isSelected = true
        iconCollection.currentItem = DICymDataManager.default.iconList.first
        iconCollection.collection.reloadData()
        
        bgColorCollection.currentItem = DICymDataManager.default.bgColorList[0]
        bgColorCollection.collection.reloadData()
        
        iconColorCollection.currentItem = DICymDataManager.default.bgColorList[1]
        iconColorCollection.collection.reloadData()
        
        iconCollection.isHidden = false
        bgColorCollection.isHidden = true
        iconColorCollection.isHidden = true
        
        cornerAdjustBgV.cornerSlider.value = 0.5
        cornerAdjustBgV.sizeSlider.value = 0.5
        cornerAdjustBgV.cornderSlideValueChange(sender: cornerAdjustBgV.cornerSlider)
        cornerAdjustBgV.sizeSlideValueChange(sender: cornerAdjustBgV.sizeSlider)
        iconBgV.backgroundColor(UIColor(hexString: bgColorCollection.currentItem ?? "#FFFFFF")!)
        iconImgV.image = UIImage(named: iconCollection.currentItem?.bigName ?? "")?.withRenderingMode(.alwaysTemplate)
        iconImgV.tintColor(UIColor(hexString: iconColorCollection.currentItem ?? "#FFFFFF")!)
        

    }
    
    func setupView() {
        view.backgroundColor(UIColor(hexString: "#283034")!)
        //
        let backBtn = UIButton()
        backBtn
            .image(UIImage(named: "all_arrow_left"))
            .adhere(toSuperview: view)
        backBtn.addTarget(self, action: #selector(backBtnClick(sender: )), for: .touchUpInside)
        backBtn.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.left.equalTo(10)
            $0.width.equalTo(44)
            $0.height.equalTo(44)
        }
        
        //
        let saveBtn = UIButton()
        saveBtn.backgroundColor(UIColor(hexString: "#FFDC4D")!)
            .title("Save")
            .titleColor(UIColor(hexString: "#212426")!)
            .adhere(toSuperview: view)
        saveBtn.layer.cornerRadius = 18
        saveBtn.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(36)
            $0.right.equalToSuperview().offset(-16)
            $0.centerY.equalTo(backBtn.snp.centerY)
        }
        saveBtn.addTarget(self, action: #selector(saveBtnClick(sender:)), for: .touchUpInside)
        
        //
        let bottomBar = UIView()
        bottomBar.backgroundColor(UIColor(hexString: "#39464D")!)
            .adhere(toSuperview: view)
        bottomBar.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-44)
        }
        
//        105 150 105
//
        let leftPadding: CGFloat = (UIScreen.width - 105 - 150 - 105) / 4
        
        //

        iconBtn.backgroundColor(UIColor(hexString: "#39464D")!, .normal)
            .backgroundColor(UIColor(hexString: "#3D98E7")!, .selected)
            .title("Icon")
            .titleColor(.white, .normal)
            .titleColor(.black, .selected)
            .image(UIImage(named: "editor_icon"), .normal)
            .image(UIImage(named: "editor_icon_selected"), .selected)
            .adhere(toSuperview: bottomBar)
        iconBtn.snp.makeConstraints {
            $0.left.equalToSuperview().offset(leftPadding)
            $0.height.equalTo(36)
            $0.top.equalTo(bottomBar.snp.top).offset(4)
            $0.width.equalTo(105)
        }
        iconBtn.layer.cornerRadius = 18
        iconBtn.layer.masksToBounds = true
        iconBtn.addTarget(self, action: #selector(iconBtnClick(sender:)), for: .touchUpInside)
        iconBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 2)
        iconBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 0)
        //
        //

        bgBtn.backgroundColor(UIColor(hexString: "#39464D")!, .normal)
            .backgroundColor(UIColor(hexString: "#3D98E7")!, .selected)
            .title("Background")
            .titleColor(.white, .normal)
            .titleColor(.black, .selected)
            .image(UIImage(named: "editor_background"), .normal)
            .image(UIImage(named: "editor_background_selected"), .selected)
            .adhere(toSuperview: bottomBar)
        bgBtn.snp.makeConstraints {
            $0.left.equalTo(iconBtn.snp.right).offset(leftPadding)
            $0.height.equalTo(36)
            $0.top.equalTo(bottomBar.snp.top).offset(4)
            $0.width.equalTo(150)
        }
        bgBtn.layer.cornerRadius = 18
        bgBtn.layer.masksToBounds = true
        bgBtn.addTarget(self, action: #selector(bgBtnClick(sender: )), for: .touchUpInside)
        bgBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 2)
        bgBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 0)
        //
        
        iconColorBtn.backgroundColor(UIColor(hexString: "#39464D")!, .normal)
            .backgroundColor(UIColor(hexString: "#3D98E7")!, .selected)
            .title("Color")
            .titleColor(.white, .normal)
            .titleColor(.black, .selected)
            .image(UIImage(named: "editor_color"), .normal)
            .image(UIImage(named: "editor_color_selected"), .selected)
            .adhere(toSuperview: bottomBar)
        iconColorBtn.snp.makeConstraints {
            $0.left.equalTo(bgBtn.snp.right).offset(leftPadding)
            $0.height.equalTo(36)
            $0.top.equalTo(bottomBar.snp.top).offset(4)
            $0.width.equalTo(105)
        }
        iconColorBtn.layer.cornerRadius = 18
        iconColorBtn.layer.masksToBounds = true
        iconColorBtn.addTarget(self, action: #selector(iconColorBtnClick(sender: )), for: .touchUpInside)
        iconColorBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 2)
        iconColorBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 0)
        //
        
        let toolBar = UIView()
        toolBar.backgroundColor(UIColor(hexString: "#39464D")!)
            .adhere(toSuperview: view)
        toolBar.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(bottomBar.snp.top)
            $0.height.equalTo(106)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            toolBar.roundCorners([.topLeft, .topRight], radius: 24)
        }
        
        //
        
        iconCollection.adhere(toSuperview: toolBar)
        iconCollection.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }
        iconCollection.itemClickBlock = {
            [weak self] item, vip in
            guard let `self` = self else {return}
            self.iconImgV.image = UIImage(named: item.bigName ?? "")?.withRenderingMode(.alwaysTemplate)
            self.isVipIcon = vip
        }
        
        //
        bgColorCollection.adhere(toSuperview: toolBar)
        bgColorCollection.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }
        bgColorCollection.itemClickBlock = {
            [weak self] item, vip in
            guard let `self` = self else {return}
            self.iconBgV.backgroundColor(UIColor(hexString: item)!)
            self.isVipBgColor = vip
        }
        
        //
        iconColorCollection.adhere(toSuperview: toolBar)
        iconColorCollection.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }
        iconColorCollection.itemClickBlock = {
            [weak self] item, vip in
            guard let `self` = self else {return}
            self.iconImgV.tintColor = UIColor(hexString: item)
            self.isVipIconColor = vip
        }
        
        //
        
        cornerAdjustBgV.adhere(toSuperview: view)
        cornerAdjustBgV.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(toolBar.snp.top)
            $0.height.equalTo(48 + 72)
        }
        cornerAdjustBgV.cornerChangeBlock = {
            [weak self] value in
            guard let `self` = self else {return}
            self.iconBgV.layer.cornerRadius = value
        }
        cornerAdjustBgV.sizeChangeBlock = {
            [weak self] value in
            guard let `self` = self else {return}
            self.iconImgV.bounds = CGRect(x: 0, y: 0, width: value, height: value)
        }
        
        //
        
        contentBgV.adhere(toSuperview: view)
        contentBgV.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(backBtn.snp.bottom)
            $0.bottom.equalTo(cornerAdjustBgV.snp.top)
        }
        //
        
        
    }
    
    

}

extension DIyEditVC {
    
    func setupCoinAlertView() {
        
        coinAlertView.alpha = 0
        view.addSubview(coinAlertView)
        coinAlertView.snp.makeConstraints {
            $0.left.right.bottom.top.equalToSuperview()
        }
        
    }

    func showCUnlockcoinAlertView() {
        // show coin alert
        
        self.view.bringSubviewToFront(self.coinAlertView)
        
        UIView.animate(withDuration: 0.35) {
            self.coinAlertView.alpha = 1
        }
        
        coinAlertView.okBtnClickBlock = {
            [weak self] in
            guard let `self` = self else {return}
            
            if DIynymCoinManagr.default.coinCount >= DIynymCoinManagr.default.coinCostCount {
                DispatchQueue.main.async {
                     
                    DIynymCoinManagr.default.costCoin(coin: DIynymCoinManagr.default.coinCostCount)
                    DispatchQueue.main.async {
                        self.saveAction()
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self.showAlert(title: "", message: "Insufficient Coins balance, please buy first.", buttonTitles: ["OK"], highlightedButtonIndex: 0) { i in
                        DispatchQueue.main.async {
                            [weak self] in
                            guard let `self` = self else {return}
                            self.navigationController?.pushViewController(DIyStoreVC(), animated: true)
                        }
                    }
                }
            }

            UIView.animate(withDuration: 0.25) {
                self.coinAlertView.alpha = 0
            } completion: { finished in
                if finished {
                    
                }
            }
        }
         
        
        coinAlertView.backBtnClickBlock = {
            [weak self] in
            guard let `self` = self else {return}
            UIView.animate(withDuration: 0.25) {
                self.coinAlertView.alpha = 0
            } completion: { finished in
                if finished {
                    
                }
            }
        }
        
    }
    
}

extension DIyEditVC {
    @objc func backBtnClick(sender: UIButton) {
        if self.navigationController != nil {
            self.navigationController?.popViewController()
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func saveBtnClick(sender: UIButton) {
        if isVipIcon == false && isVipIconColor == false && isVipBgColor == false {
            // save
            saveAction()
        } else {
            //
            showCUnlockcoinAlertView()
        }
    }
    
    func saveAction() {
//        let saveRadiusValue = iconBgV.layer.cornerRadius
//        iconBgV.layer.cornerRadius = 0
        let saveWidth: CGFloat = UIScreen.width * UIScreen.main.scale
        let scale: CGFloat = saveWidth / iconBgV.bounds.width
        let bgV = UIView(frame: CGRect(x: 0, y: 0, width: saveWidth, height: saveWidth))
        bgV.backgroundColor(iconBgV.backgroundColor ?? .white)
        let saveImgV = UIImageView()
        saveImgV.adhere(toSuperview: bgV)
        saveImgV.center = CGPoint(x: saveWidth/2, y: saveWidth/2)
        let saveIconWidth: CGFloat = iconImgV.bounds.width * scale
        saveImgV.bounds = CGRect(x: 0, y: 0, width: saveIconWidth, height: saveIconWidth)
        if let cgI = iconImgV.image?.cgImage {
            saveImgV.image = UIImage(cgImage: cgI).withRenderingMode(.alwaysTemplate)
        }
        
        saveImgV.tintColor = iconImgV.tintColor
        bgV.layer.cornerRadius = (saveWidth / 2) * CGFloat(cornerAdjustBgV.cornerSlider.value)
        
        if let imgV = bgV.screenshot {
            saveImgsToAlbum(imgs: [imgV])
        }
//        iconBgV.layer.cornerRadius = saveRadiusValue
    }
    
    @objc func bgBtnClick(sender: UIButton) {
        iconBtn.isSelected = false
        bgBtn.isSelected = true
        iconColorBtn.isSelected = false
        
        iconCollection.isHidden = true
        bgColorCollection.isHidden = false
        iconColorCollection.isHidden = true
    }
    
    @objc func iconBtnClick(sender: UIButton) {
        iconBtn.isSelected = true
        bgBtn.isSelected = false
        iconColorBtn.isSelected = false
        
        iconCollection.isHidden = false
        bgColorCollection.isHidden = true
        iconColorCollection.isHidden = true
    }
    
    @objc func iconColorBtnClick(sender: UIButton) {
        iconBtn.isSelected = false
        bgBtn.isSelected = false
        iconColorBtn.isSelected = true
        
        iconCollection.isHidden = true
        bgColorCollection.isHidden = true
        iconColorCollection.isHidden = false
        
    }
    
    
}

extension DIyEditVC {
    func saveImgsToAlbum(imgs: [UIImage]) {
        HUD.hide()
        let status = PHPhotoLibrary.authorizationStatus()
        if status == .authorized {
            saveToAlbumPhotoAction(images: imgs)
        } else if status == .notDetermined {
            PHPhotoLibrary.requestAuthorization({[weak self] (status) in
                guard let `self` = self else {return}
                DispatchQueue.main.async {
                    if status != .authorized {
                        return
                    }
                    self.saveToAlbumPhotoAction(images: imgs)
                }
            })
        } else {
            // 权限提示
            albumPermissionsAlet()
        }
    }
    
    func saveToAlbumPhotoAction(images: [UIImage]) {
        DispatchQueue.main.async(execute: {
            PHPhotoLibrary.shared().performChanges({
                [weak self] in
                guard let `self` = self else {return}
                for img in images {
                    PHAssetChangeRequest.creationRequestForAsset(from: img)
                }
                DispatchQueue.main.async {
                    [weak self] in
                    guard let `self` = self else {return}
                    self.showSaveSuccessAlert()
                }
                
            }) { (finish, error) in
                if error != nil {
                    HUD.error("Sorry! please try again")
                }
            }
        })
    }
    
    func showSaveSuccessAlert() {
        

        DispatchQueue.main.async {
            let title = ""
            let message = "Photo saved successfully!"
            let okText = "OK"
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: okText, style: .cancel, handler: { (alert) in
                 DispatchQueue.main.async {
                 }
            })
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    func albumPermissionsAlet() {
        let alert = UIAlertController(title: "Ooops!", message: "You have declined access to photos, please active it in Settings>Privacy>Photos.", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { [weak self] (actioin) in
            self?.openSystemAppSetting()
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
        }
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func openSystemAppSetting() {
        let url = NSURL.init(string: UIApplication.openSettingsURLString)
        let canOpen = UIApplication.shared.canOpenURL(url! as URL)
        if canOpen {
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }
    }
 
}
