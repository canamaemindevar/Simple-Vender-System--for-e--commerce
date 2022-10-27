//
//  PostModel.swift
//  Vender
//
//  Created by Emincan on 26.10.2022.
//

import Foundation

struct PostModel: Codable {
    let userID: Int?
    let id: Int?
    let title: String?
    let body: String?
}
