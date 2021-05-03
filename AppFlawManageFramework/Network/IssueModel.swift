//
//  IssueModel.swift
//  AppFlawManageFramework
//
//  Created by Dev on 2021/04/23.
//

import Foundation


struct Issue: Codable {
    var data: [Data]
    
    enum CodingKeys: String, CodingKey {
        case data = "issue"
    }
    
    struct Data: Codable {
        var project_id: String?
        var subject: String?
        var description: String
    }
}
