//
//  HomeModelEntity.swift
//  anupongTest
//
//  Created by anupong dorkkunm on 28/6/2565 BE.
//

import Foundation
enum GoalStatus:String, CodingKey {
case Good
case Unhappy
}

enum Goaltype:String, CodingKey {
case Travel
case Education
case Invest
case Clothing
}

struct GoalModel {
    let name: String
    let status: GoalStatus
    let currentBudget:Int
    let totalBudget:Int
    let type:Goaltype
    let goallDate:Date
}


struct OfferModel {
    let image:String
    let cellUrl:String
}

struct SuggestModel {
    let image:String
    let cellUrl:String
}
