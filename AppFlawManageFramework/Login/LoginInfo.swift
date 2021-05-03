//
//  LoginInfo.swift
//  AppFlawManageFramework
//
//  Created by Dev on 2021/04/20.
//

import Foundation

public struct UserDefaultKey {
    static let serverUrl = "serverUrl"
    static let userId = "id"
    static let userPassword = "password"
    static let userName = "userName"
}



open class LoginInfo {
    public static var instance = LoginInfo()
    
    var isLogin: Bool = false
    var serverUrl: String? {
        return UserDefaults.standard.string(forKey: UserDefaultKey.serverUrl)
    }
    open var id: String? {
        return UserDefaults.standard.string(forKey: UserDefaultKey.userId)
    }
    open var password: String? {
        return UserDefaults.standard.string(forKey: UserDefaultKey.userPassword)
    }
    open var name: String? {
        return UserDefaults.standard.string(forKey: UserDefaultKey.userName)
    }
    
    open func getLoginInfo() -> [String: Any?] {
        return ["serverUrl": serverUrl,
                "id": id, "password": password, "name": name]
    }
}

extension LoginInfo {

}

