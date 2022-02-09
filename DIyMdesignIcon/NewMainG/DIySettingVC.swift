//
//  DIySettingVC.swift
//  DIyMdesignIcon
//
//  Created by Joe on 2022/1/11.
//

import UIKit
import MessageUI
import StoreKit
import Defaults
import NoticeObserveKit

 
class HPymSeettingVC: UIViewController {
    var upVC: UIViewController?
    let backBtn = UIButton(type: .custom)
    let titleLabel = UILabel(text: "Setting")
    let privacyBtn = HPymSettingBtn()
    let termsBtn = HPymSettingBtn()
    let feedbackBtn = HPymSettingBtn()
    let loginBtn = UIButton()
    let logoutBtn = UIButton()
    
    
    var loginBtnClickBlock: (()->Void)?
    
    
    let accountBgView = UIView()
    let coinInfoBgView = UIView()
    let userNameLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#3D98E7")
        setupView()
        setupContent()
        updateUserAccountStatus()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUserAccountStatus()
    }
    

     
}

extension HPymSeettingVC {
    func setupView() {
        view.addSubview(backBtn)
        backBtn.setImage(UIImage(named: "all_arrow_left"), for: .normal)
        backBtn.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.left.equalTo(10)
            $0.width.height.equalTo(44)
        }
        backBtn.addTarget(self, action: #selector(backBtnClick(sender:)), for: .touchUpInside)
         
        
    }
    
    func setupContent() {
        
        // login

        loginBtn.backgroundColor(UIColor(hexString: "#FFDC4D")!)
            .title("Log in")
            .titleColor(UIColor(hexString: "#212426")!)
            .adhere(toSuperview: view)
        loginBtn.layer.cornerRadius = 18
        loginBtn.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(36)
            $0.right.equalToSuperview().offset(-16)
            $0.centerY.equalTo(backBtn.snp.centerY)
        }
        loginBtn.addTarget(self, action: #selector(loginBtnClick(sender:)), for: .touchUpInside)
        
        
        // logout
        logoutBtn.image(UIImage(named: "setting_signout"))
            .adhere(toSuperview: view)
        logoutBtn.snp.makeConstraints {
            $0.width.equalTo(44)
            $0.height.equalTo(44)
            $0.right.equalTo(loginBtn.snp.right)
            $0.centerY.equalTo(loginBtn.snp.centerY)
        }
        logoutBtn.addTarget(self, action: #selector(logoutBtnClick(sender:)), for: .touchUpInside)
        
        // user name label
        view.addSubview(userNameLabel)
        userNameLabel.textAlignment = .center
        userNameLabel.adjustsFontSizeToFitWidth = true
        userNameLabel.textColor = .white
        userNameLabel.font = UIFont(name: "GillSans", size: 20)
        userNameLabel.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.centerY.equalTo(backBtn.snp.centerY)
            $0.width.height.greaterThanOrEqualTo(40)
            
        }
        
        //
        let iconImgV = UIImageView()
        iconImgV.image("setting_logo")
            .adhere(toSuperview: view)
            .contentMode(.scaleAspectFit)
        iconImgV.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(backBtn.snp.bottom).offset(50)
            $0.width.height.equalTo(128)
        }
        //
        let titleNameLabel1 = UILabel()
        titleNameLabel1.fontName(28, "GillSans-Bold")
            .color(.white)
            .text("Design Exclusive Icon")
            .adhere(toSuperview: view)
        titleNameLabel1.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(iconImgV.snp.bottom).offset(16)
            $0.width.height.greaterThanOrEqualTo(40)
        }
        
        //
        let titleNameLabel2 = UILabel()
        titleNameLabel2.fontName(20, "GillSans-Light")
            .color(UIColor.white.withAlphaComponent(0.5))
            .text("Welcome to Icon Universe")
            .adhere(toSuperview: view)
        titleNameLabel2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleNameLabel1.snp.bottom).offset(4)
            $0.width.height.greaterThanOrEqualTo(40)
        }
        
        
        // privacy
        privacyBtn.nameLa.text("Privacy Policy")
        view.addSubview(privacyBtn)
        privacyBtn.snp.makeConstraints {
            $0.left.equalTo(48)
            $0.height.equalTo(64)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleNameLabel2.snp.bottom).offset(60)
        }
        privacyBtn.addTarget(self, action: #selector(privacyBtnClick(sender:)), for: .touchUpInside)
        
        // feed
        feedbackBtn.nameLa.text("Feedback")
        view.addSubview(feedbackBtn)
        feedbackBtn.snp.makeConstraints {
            $0.left.equalTo(48)
            $0.height.equalTo(64)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(privacyBtn.snp.bottom).offset(16)
        }
        feedbackBtn.addTarget(self, action: #selector(feedbackBtnClick(sender:)), for: .touchUpInside)
        
        
        
        
        
        // terms
        
        termsBtn.nameLa.text("Terms of use")
        view.addSubview(termsBtn)
        termsBtn.snp.makeConstraints {
            $0.left.equalTo(48)
            $0.height.equalTo(64)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(feedbackBtn.snp.bottom).offset(16)
            
        }
        termsBtn.addTarget(self, action: #selector(termsBtnClick(sender:)), for: .touchUpInside)
        
        
       
        
        
        
//
//
//        // accountBgView
//        accountBgView.backgroundColor = .clear
//        view.addSubview(accountBgView)
//        accountBgView.snp.makeConstraints {
//            $0.center.equalTo(loginBtn)
//            $0.width.equalToSuperview()
//            $0.centerX.equalToSuperview()
//
//        }
//
//        // coin info bg view
//        let topCoinLabel = UILabel()
//        topCoinLabel.textAlignment = .right
//        topCoinLabel.text = "\(InCymCoinManagr.default.coinCount)"
//        topCoinLabel.textColor = UIColor(hexString: "#2A2A2A")
//        topCoinLabel.font = UIFont(name: "PingFangSC-Semibold", size: 22)
//        accountBgView.addSubview(topCoinLabel)
//        topCoinLabel.snp.makeConstraints {
//            $0.centerY.equalToSuperview()
//            $0.centerX.equalToSuperview().offset(-28)
//            $0.height.equalTo(30)
//            $0.width.greaterThanOrEqualTo(25)
//        }
//
//        let coinImageV = UIImageView()
//        coinImageV.image = UIImage(named: "coins_icon3")
//        coinImageV.contentMode = .scaleAspectFit
//        accountBgView.addSubview(coinImageV)
//        coinImageV.snp.makeConstraints {
//            $0.centerY.equalTo(topCoinLabel)
//            $0.left.equalTo(topCoinLabel.snp.right).offset(10)
//            $0.width.height.equalTo(20)
//        }
        
    }
}

extension HPymSeettingVC {
    func updateUserAccountStatus() {
        if let userModel = LoginManage.currentLoginUser() {
            let userName  = userModel.userName
            let name = (userName?.count ?? 0) > 0 ? userName : "Signed in with apple ID"
            userNameLabel.text(name)
            logoutBtn.isHidden = false
            loginBtn.isHidden = true
            userNameLabel.isHidden = false
            titleLabel.isHidden = true
        } else {
            userNameLabel.text("")
            logoutBtn.isHidden = true
            loginBtn.isHidden = false
            userNameLabel.isHidden = true
            titleLabel.isHidden = false
        }
    }
}

extension HPymSeettingVC {
    
}



extension HPymSeettingVC {
    @objc func backBtnClick(sender: UIButton) {
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController()
        }
    }
}



extension HPymSeettingVC {
    @objc func privacyBtnClick(sender: UIButton) {
        UIApplication.shared.openURL(url: PrivacyPolicyURLStr)
    }
    
    @objc func termsBtnClick(sender: UIButton) {
        UIApplication.shared.openURL(url: TermsofuseURLStr)
    }
    
    @objc func feedbackBtnClick(sender: UIButton) {
        feedback()
    }
    
    @objc func loginBtnClick(sender: UIButton) {
        let logVc = ApLoginVC()
        logVc.backClickActionBlock = {
            
        }
        self.navigationController?.pushViewController(logVc, animated: true)
//        backBtnClick(sender: backBtn)
//        if let mainVC = self.upVC as? HPymMainVC {
//            mainVC.showLoginVC()
//        }
        
    }
    
    @objc func logoutBtnClick(sender: UIButton) {
        LoginManage.shared.logout()
        updateUserAccountStatus()
    }
    
    
     
}



extension HPymSeettingVC: MFMailComposeViewControllerDelegate {
    func feedback() {
        //首先要判断设备具不具备发送邮件功能
        if MFMailComposeViewController.canSendMail(){
            //获取系统版本号
            let systemVersion = UIDevice.current.systemVersion
            let modelName = UIDevice.current.modelName
            
            let infoDic = Bundle.main.infoDictionary
            // 获取App的版本号
            let appVersion = infoDic?["CFBundleShortVersionString"] ?? "8.8.8"
            // 获取App的名称
            let appName = "\(AppName)"
            
            
            let controller = MFMailComposeViewController()
            //设置代理
            controller.mailComposeDelegate = self
            //设置主题
            controller.setSubject("\(appName) Feedback")
            //设置收件人
            // FIXME: feed back email
            controller.setToRecipients([feedbackEmail])
            //设置邮件正文内容（支持html）
            controller.setMessageBody("\n\n\nSystem Version：\(systemVersion)\n Device Name：\(modelName)\n App Name：\(appName)\n App Version：\(appVersion )", isHTML: false)
            
            //打开界面
            self.present(controller, animated: true, completion: nil)
        }else{
            HUD.error("The device doesn't support email")
        }
    }
    
    //发送邮件代理方法
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}





class HPymSettingBtn: UIButton {
    
    var nameLa = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        let bgImgV = UIImageView()
        bgImgV
            .backgroundColor(UIColor(hexString: "#D1EAFF")!)
            .adhere(toSuperview: self)
            .contentMode(.scaleAspectFit)
        bgImgV.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }
        bgImgV.layer.cornerRadius = 64/2
        //
        nameLa
            .fontName(24, "GillSans-SemiBold")
            .color(.black)
            .text("")
            .numberOfLines(1)
            .textAlignment(.center)
            .adhere(toSuperview: self)
        nameLa.snp.makeConstraints {
            $0.left.equalTo(30)
            $0.center.equalToSuperview()
            $0.height.greaterThanOrEqualTo(30)
        }
    }
    
    
}

