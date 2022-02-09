//
//  ApLoginVC.swift
//  DIyMdesignIcon
//
//  Created by Joe on 2022/1/11.
//

import UIKit
//import FirebaseAuth
//import FirebaseUI
//import FirebaseAuthUI
//import Firebase
import AuthenticationServices
import SnapKit

class ApLoginVC: UIViewController {
    
//    let ppUrl = "http://late-language.surge.sh/Privacy_Agreement.htm"
//    let touUrl = "http://late-language.surge.sh/Terms_of_use.htm"
    
    let def_fontName = ""
    
    var fatherVC: UIViewController?
    
    let contentBgView = UIView()
    
    var backClickActionBlock: (()->Void)?
    
    
    
    override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nil, bundle: bundle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var buttons: [UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor(UIColor(hexString: "#3D98E7")!)
//        view.backgroundColor = .white//
        
//        self.findButtons(subView: self.view)
        
        //
        let bgBtn = UIButton()
        bgBtn.addTarget(self, action: #selector(closebuttonClick(button: )), for: .touchUpInside)
        bgBtn.adhere(toSuperview: view)
        
        
        contentBgView.backgroundColor = .clear
        view.addSubview(contentBgView)
        contentBgView.snp.makeConstraints {
            $0.left.equalTo(8)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(150)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
        
        //
        bgBtn.snp.makeConstraints {
            $0.left.right.top.equalToSuperview()
            $0.bottom.equalTo(contentBgView.snp.top)
        }
        
        
        //
        let appleButton = ASAuthorizationAppleIDButton(type: .signIn, style: .white)
        appleButton.addTarget(self, action: #selector(appleButtonClick(button:)), for: .touchUpInside)
        self.view.addSubview(appleButton)
        appleButton.layer.cornerRadius = 54/2
        appleButton.layer.masksToBounds = true
        appleButton.backgroundColor(UIColor(hexString: "#D1EAFF")!)
//        appleButton.layer.borderWidth = 1
//        appleButton.layer.borderColor = UIColor(hexString: "#DFDFDF")?.cgColor
        appleButton.snp.makeConstraints { (make) in
            make.width.equalTo(310)
            make.height.equalTo(54)
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(contentBgView.snp.bottom).offset(-85)
        }
        
        /*
        let googleButton = buttons[0]
        googleButton.layer.cornerRadius = 24
        googleButton.layer.borderWidth = 1
        googleButton.layer.borderColor = UIColor(hex: "#DFDFDF")?.cgColor
        googleButton.layer.masksToBounds = true
        googleButton.setTitle(" Sign in with Google", for: .normal)
        googleButton.setTitleColor(.black, for: .normal)
        googleButton.titleLabel?.font = customFont(fontName: "SF-Pro-Text-Medium.otf", size: 18)
        googleButton.frame = CGRect.zero
        googleButton.backgroundColor = .white
        googleButton.contentHorizontalAlignment = .center
        self.authUI.delegate = self
        self.view.addSubview(googleButton)
        googleButton.snp.makeConstraints { (make) in
            make.width.equalTo(280)
            make.height.equalTo(48)
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(contentBgView.snp.bottom).offset(-85)
        }
*/
        // Do any additional setup after loading the view.
//        let bgImageView = UIImageView()
//        bgImageView.image = UIImage(named: "log_in_bg")
//        bgImageView.contentMode = .scaleAspectFill
//        self.view.insertSubview(bgImageView, at: 0)
//        bgImageView.snp.makeConstraints { (make) in
//            make.top.left.bottom.right.equalTo(0)
//        }
//
//        let topView = UIView()
//        topView.backgroundColor = UIColor.clear
//        self.view.addSubview(topView)
//        topView.snp.makeConstraints { (make) in
//            make.left.right.equalTo(0)
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
//            make.height.equalTo(44)
//        }
        
        
        
        
        //
        let backBtn = UIButton()
//        closebutton.alpha = 0.5
        backBtn.setImage(UIImage(named: "all_arrow_left"), for: .normal)
        backBtn.addTarget(self, action: #selector(closebuttonClick(button:)), for: .touchUpInside)
        contentBgView.addSubview(backBtn)
        backBtn.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.left.equalTo(10)
            $0.width.height.equalTo(44)
        }
         
        
        //
        let iconImgV = UIImageView()
        iconImgV.image("signin_img")
            .adhere(toSuperview: view)
            .contentMode(.scaleAspectFit)
        iconImgV.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(backBtn.snp.bottom).offset(47)
            $0.width.height.equalTo(240)
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
        
        // title
//        let nameLabel = UILabel()
//        nameLabel.textAlignment = .center
//        nameLabel.text = "Try Your Style"
//        nameLabel.font = UIFont(name: "Avenir-Black", size: 24)
//        nameLabel.textColor = UIColor(hexString: "#252525")
//        contentBgView.addSubview(nameLabel)
//        nameLabel.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.top.equalTo(imageView.snp.bottom).offset(24)
//            $0.width.equalTo(240)
//            $0.height.equalTo(33)
//        }
//
//        // info
//        let infoLabel = UILabel()
//        infoLabel.textAlignment = .center
//        infoLabel.numberOfLines = 5
//        infoLabel.text = "Looking for a new hairstyle?\nTry on a new hairstyle\nsee if suits you!"
//        infoLabel.font = UIFont(name: "Avenir-Medium", size: 14)
//        infoLabel.textColor = UIColor(hexString: "#252525")
//        contentBgView.addSubview(infoLabel)
//        infoLabel.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.top.equalTo(nameLabel.snp.bottom).offset(24)
//            $0.width.equalTo(240)
//            $0.height.equalTo(90)
//        }
        
        let bottomView = UIView()
        bottomView.backgroundColor = .clear
        self.view.addSubview(bottomView)
        bottomView.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(40)
            $0.bottom.equalTo(contentBgView.snp.bottom)
            $0.centerX.equalTo(contentBgView.snp.centerX)
        }
        
        let ppButton = UIButton()
        let str = NSMutableAttributedString(string: "Privacy Policy &")
        let strRange = NSRange.init(location: 0, length: str.length)
        //此处必须转为NSNumber格式传给value，不然会报错
        let number = NSNumber(integerLiteral: NSUnderlineStyle.single.rawValue)
        str.addAttributes([NSAttributedString.Key.underlineStyle: number,
                           NSAttributedString.Key.foregroundColor: UIColor.init(hexString: "#FFFFFF")?.withAlphaComponent(0.7) ?? .white,
                           NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 12)!],
                          range: strRange)
        ppButton.setAttributedTitle(str, for: UIControl.State.normal)
        ppButton.contentHorizontalAlignment = .right
        ppButton.tag = 1001
        ppButton.addTarget(self, action: #selector(buttonClick(button:)), for: .touchUpInside)
        bottomView.addSubview(ppButton)
        ppButton.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.bottom.equalTo(-20)
            make.left.equalTo(0)
        }
        
        let tou = UIButton()
        let toustr = NSMutableAttributedString(string: " Terms of Use")
        let toustrRange = NSRange.init(location: 0, length: toustr.length)
        //此处必须转为NSNumber格式传给value，不然会报错
        let tounumber = NSNumber(integerLiteral: NSUnderlineStyle.single.rawValue)
        toustr.addAttributes([NSAttributedString.Key.underlineStyle: tounumber,
                              NSAttributedString.Key.foregroundColor: UIColor.init(hexString: "#FFFFFF")?.withAlphaComponent(0.7) ?? .white,
                           NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 12)!],
                          range: toustrRange)
        tou.setAttributedTitle(toustr, for: UIControl.State.normal)
        tou.contentHorizontalAlignment = .left
        tou.tag = 1002
        tou.addTarget(self, action: #selector(buttonClick(button:)), for: .touchUpInside)
        bottomView.addSubview(tou)
        tou.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.bottom.equalTo(-20)
            make.right.equalTo(-2)
        }
        
    }
    
    func findButtons(subView: UIView) {
        
        if subView.isKind(of: UIButton.classForCoder()) {
            
            if let button = subView as? UIButton {
                buttons.append(button)
            }
            return
        } else {
            subView.backgroundColor = .clear
        }
        
        for sv in subView.subviews {
            findButtons(subView: sv)
        }
    }
    
    @objc func closebuttonClick(button: UIButton) {
//        self.dismiss(animated: true) {
//        }
        if self.navigationController != nil {
            self.navigationController?.popViewController()
        } else {
            self.dismiss(animated: true, completion: nil)
        }
        backClickActionBlock?()
        
    }
    
    @objc func appleButtonClick(button: UIButton) {
        let requestID = ASAuthorizationAppleIDProvider().createRequest()
                // 这里请求了用户的姓名和email
                requestID.requestedScopes = [.fullName, .email]
                
                let controller = ASAuthorizationController(authorizationRequests: [requestID])
                controller.delegate = self
                controller.presentationContextProvider = self
                controller.performRequests()
    }
    
    func customFont(fontName: String, size: CGFloat) -> UIFont {
        let stringArray: Array = fontName.components(separatedBy: ".")
        let path = Bundle.main.path(forResource: stringArray[0], ofType: stringArray[1])
        let fontData = NSData.init(contentsOfFile: path ?? "")
        
        let fontdataProvider = CGDataProvider(data: CFBridgingRetain(fontData) as! CFData)
        let fontRef = CGFont.init(fontdataProvider!)!
        
        var fontError = Unmanaged<CFError>?.init(nilLiteral: ())
        CTFontManagerRegisterGraphicsFont(fontRef, &fontError)
        
        let fontName: String =  fontRef.postScriptName as String? ?? ""
        let font = UIFont(name: fontName, size: size)
        
        fontError?.release()
        
        return font ?? UIFont(name: def_fontName, size: size)!
    }
    
    @objc func buttonClick(button: UIButton) {
        
        switch button.tag {
             
        case 1001:
            let url = URL(string: PrivacyPolicyURLStr)
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            break
            
        case 1002:
            let url = URL(string: TermsofuseURLStr)
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            break

        default:
            break
        }
    }

       

}

extension ApLoginVC: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // 请求完成，但是有错误
    }
    
    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithAuthorization authorization: ASAuthorization) {
        // 请求完成， 用户通过验证
        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {
            // 拿到用户的验证信息，这里可以跟自己服务器所存储的信息进行校验，比如用户名是否存在等。
            //                let detailVC = DetailVC(cred: credential)
            //                self.present(detailVC, animated: true, completion: nil)
            
            print(credential)
            debugPrint("credential.user = \(credential.user)")
            LoginManage.saveAppleUserIDAndUserName(userID: credential.user, userName: credential.email ?? "")
            if self.navigationController != nil {
                self.navigationController?.popViewController()
            } else {
                self.dismiss(animated: true, completion: nil)
            }
            backClickActionBlock?()
            
        } else {
            
        }
    }
}

extension ApLoginVC: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        var windowt = UIWindow()
        
        for windowScene in UIApplication.shared.connectedScenes {
            if windowScene.activationState == .foregroundActive {
                if let windowScene_t = windowScene as? UIWindowScene {
                    for window in windowScene_t.windows {
                        if window.isKeyWindow {
                            windowt = window
                            break
                        }
                    }
                }
            }
        }
 
        return windowt //(UIApplication.shared.delegate as! AppDelegate).window!
    }
}
