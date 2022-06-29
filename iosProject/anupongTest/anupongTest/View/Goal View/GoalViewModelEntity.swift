//
//  GoalViewModelEntity.swift
//  anupongTest
//
//  Created by anupong dorkkunm on 28/6/2565 BE.
//

import Foundation

enum TextFormInputType {
    case normal
    case datePicker
    case dropdown
}

struct GoalTextMenu {
    let type:TextFormInputType
    let placeHolder:String
    let unit:String
}

struct GoalFormMenu {
    let name:String
    let data:[Any]
}
