//
//  LoginManager.swift
//  DIyMdesignIcon
//
//  Created by Joe on 2022/1/11.
//


import UIKit
//import FirebaseAuthUI
//import FirebaseAuth
//import Firebase
import CryptoKit
import AuthenticationServices
//import FirebaseGoogleAuthUI


import Foundation

import UIKit

class UserInfoModel: NSObject {
    
    var userName: String? = ""
    var isAppleLogin = false

}


let keyChainKey = "appLogInasdlfkjas;ljfl;asdjf;ald"

class LoginManage: NSObject {
    
//    let authUI = FUIAuth.defaultAuthUI()
    fileprivate var currentNonce: String?
    
    class func receivesAuthenticationProcess(url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
//          if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
//            return true
//          }
          // other URL handling goes here.
          return false
    }
    
//    class func fireAppInit() {
////        FirebaseApp.configure()
//
//
//    }
    
    
    static let shared = LoginManage()
    private override init() {
        super.init()
//        authUI?.delegate = self
        //TODO: 升级Pod 移¡除掉
//        let providers: [FUIAuthProvider] = [
//            FUIGoogleAuth.init(authUI: authUI!),
////            FUIGoogleAuth.init(authUI: authUI!),∫
//        ]
//        authUI?.providers = providers
    }
    
    class func saveAppleUserIDAndUserName(userID: String, userName: String) {
        
        let keychainManager = Keychain(service: keyChainKey)
        do {
            try keychainManager.set(userID, key: "AppleUserID")
            try keychainManager.set(userName, key: "AppleUserName")
        } catch let error {
            print(error)
        }
    }
    
    class func obtainAppleUserID() -> String {
        let keychainManager = Keychain(service: keyChainKey)
        let userID = keychainManager["AppleUserID"]
        return userID ?? ""
    }
    
    class func obtainAppleUserName() -> String {
        let keychainManager = Keychain(service: keyChainKey)
        let userID = keychainManager["AppleUserName"]
        return userID ?? ""
    }
    
    class func currentLoginUser() -> UserInfoModel? {
        
        let userModel = UserInfoModel()
        
//        if let currentUser = Auth.auth().currentUser {
//
//            userModel.isAppleLogin = false
//            if let userName = currentUser.providerData[0].displayName {
//                userModel.userName = userName
//            } else {
//                userModel.userName = currentUser.providerData[0].email
//            }
//
//            return userModel
//
//        }
        
        if self.obtainAppleUserID().count > 0 {
            userModel.isAppleLogin = false
            userModel.userName = self.obtainAppleUserName()
            return userModel
        }
        
        return nil
    }
    
    
    func googleUserLogout() {
//        let firebaseAuth = Auth.auth()
//       do {
//         try firebaseAuth.signOut()
//       } catch let signOutError as NSError {
//         print ("Error signing out: %@", signOutError)
//       }
    }
    
    func appleUserLogout() {
        let keychainManager = Keychain(service: keyChainKey)
        do {
            try keychainManager.set("", key: "AppleUserID")
            try keychainManager.set("", key: "AppleUserName")
        } catch let error {
            print(error)
        }
    }
    
    func logout() {
        googleUserLogout()
        appleUserLogout()
    }
    
//    func obtainVC() -> FUIAuthPickerViewController {
//        return CustomizeViewController.init(authUI: self.authUI!)
//    }
//
//    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, url: URL?, error: Error?) {
//        var a = authDataResult?.additionalUserInfo?.profile?["name"]
//    }
    
}
