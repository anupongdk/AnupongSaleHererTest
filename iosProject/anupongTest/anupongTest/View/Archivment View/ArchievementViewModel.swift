//
//  ArchievementViewModel.swift
//  anupongTest
//
//  Created by anupong dorkkunm on 28/6/2565 BE.
//

import Foundation

class ArchievementViewModel: ArchievementInterface, ArchievementInteractorOutput {
    var input: ArchievementInteractorInput {return self }
    var output: ArchievementInteractorOutput {return self }
    
    var archievementData = ArchievementModel(name: "", level: 0, badgeList: [ArchievementBadge]())
    var archievementDataDidChange:((ArchievementModel) -> Void)?
    
   
    
}


extension ArchievementViewModel:ArchievementInteractorInput {
    
    func getArchievementData() {
        
        archievementData = createMockArchievementData(badgeNumber: 15)
        guard archievementData != nil else {
           return
        }
        
        archievementDataDidChange?(archievementData)
    }
    
}

extension ArchievementViewModel{
    
    func createMockArchievementData(badgeNumber:Int) -> ArchievementModel{
        var arrayData = [ArchievementBadge]()
        for _ in 0...badgeNumber {
            let badge = ArchievementBadge(name: "Achievement", image: "imgMockBadge", timeStampe: Date())
            arrayData.append(badge)
        }
        let archievent = ArchievementModel(name: "main badge", level: 2, badgeList: arrayData)
        
        return archievent
    }
}
