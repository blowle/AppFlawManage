//
//  AppFlawManager.swift
//  AppFlawManageFramework
//
//  Created by Dev on 2021/04/20.
//

import UIKit

open class AppFlawManager {
    public static var shared = AppFlawManager()

}

extension AppFlawManager {
    /**
     show login view
     */
    open func show() {
        Floaty.global.button.addItem(item: settingItem())
        Floaty.global.button.isDraggable = true
        Floaty.global.show()
    }
    
    private func settingItem() -> FloatyItem {
        let item = FloatyItem()
        
        item.title = "setting"
        item.tintColor = .black
        item.handler = { _ in
            let bundle = Bundle(identifier: "com.lyc.AppFlawManageFramework")
            let loginStoryboard = UIStoryboard.init(name: "Login", bundle: bundle)
            let loginVC = loginStoryboard.instantiateViewController(withIdentifier: "LoginViewController")
            guard let rootVC = UIApplication.shared.delegate?.window??.rootViewController else { return }
            rootVC.present(loginVC, animated: true, completion: nil)
        }
        
        return item
    }
    
    private func showLogin() {
        
    }
}
