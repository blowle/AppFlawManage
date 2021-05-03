//
//  UserData.swift
//  AppFlawManageFramework
//
//  Created by Dev on 2021/04/20.
//

import Foundation

struct UserData: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}


struct PostUserData: Codable {
    let userId: String
    let id: Int?
    let title: String
    let body: String
    
//    func toUserData() -> UserData {
//        return UserData(userId: , id: <#T##Int#>, title: <#T##String#>, body: <#T##String#>)
//    }
}
