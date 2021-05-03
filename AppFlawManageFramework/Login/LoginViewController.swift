//
//  LoginViewController.swift
//  AppFlawManageFramework
//
//  Created by Dev on 2021/04/20.
//

import UIKit



open class LoginViewController: UIViewController {
    
    @IBOutlet weak var tfServerUrl: UITextField!
    @IBOutlet weak var tfUserID: UITextField!
    @IBOutlet weak var tfUserPassword: UITextField!
    @IBOutlet weak var tfUserName: UITextField!
    
    open override func viewDidLoad() {
        tfServerUrl.delegate = self
        tfUserID.delegate = self
        tfUserPassword.delegate = self
        tfUserName.delegate = self
        
        tfServerUrl.tag = 1
        tfUserID.tag = 2
        tfUserPassword.tag = 3
        tfUserName.tag = 4
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        dismissKeyboard()
    }
    
    @objc func dismissKeyboard() {
        tfServerUrl.resignFirstResponder()
        tfUserID.resignFirstResponder()
        tfUserPassword.resignFirstResponder()
        tfUserName.resignFirstResponder()
    }
    
    @IBAction func startTest(_ sender: Any) {
        print("get log Info: \(LoginInfo.instance.getLoginInfo())")
        
        if LoginInfo.instance.isLogin {
            dismiss(animated: true, completion: nil)
        } else {
            
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text?.trimmingCharacters(in: [" "]), text != "" else { return }
        switch TextType(rawValue: textField.tag) {
        case .serverUrl:
            UserDefaults.standard.setValue(text, forKey: UserDefaultKey.serverUrl)
        case .userId:
            UserDefaults.standard.setValue(text, forKey: UserDefaultKey.userId)
        case .userPassword:
            UserDefaults.standard.setValue(text, forKey: UserDefaultKey.userPassword)
        case .userName:
            UserDefaults.standard.setValue(text, forKey: UserDefaultKey.userName)
        case .none:
            break
        }
        
        print("input: \(textField.tag): \(text)")
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder() // dismiss keyboard
            return true
        }
}
