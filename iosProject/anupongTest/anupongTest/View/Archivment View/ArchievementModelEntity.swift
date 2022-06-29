//
//  ArchievementModelEntity.swift
//  anupongTest
//
//  Created by anupong dorkkunm on 28/6/2565 BE.
//

import Foundation

struct ArchievementModel {
    let name: String
    let level:Int
    let badgeList:[ArchievementBadge]
    
}

struct ArchievementBadge {
    let name:String
    let image:String
    let timeStampe:Date
}

