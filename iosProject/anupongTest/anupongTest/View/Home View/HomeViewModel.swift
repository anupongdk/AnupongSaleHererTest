//
//  HomeViewModel.swift
//  anupongTest
//
//  Created by anupong dorkkunm on 28/6/2565 BE.
//

import UIKit

class HomeViewModel: HomeInterface, HomeInteractorOutput {
    var input: HomeInteractorInput { return self }
    var output: HomeInteractorOutput { return self }
    
    var homeData = [[Any]]()
    var homeDataDidChange: (([[Any]]) -> Void)?
    
}

// MARK - Data-binding InPut
extension HomeViewModel: HomeInteractorInput {
    func getHomeData() {
        homeData = createHomeData()
        guard homeData != nil else {
           return
        }
        homeDataDidChange?(homeData)
        
    }
    
}


extension HomeViewModel{
    
    func createHomeData() ->[[Any]]{
        var arrayHomeData = [[Any]]()
        var arrayGoal = [GoalModel]()
        
        let goal1 = GoalModel(name: "ไปเที่ยวญี่ปุ่น", status: .Good, currentBudget: 16500, totalBudget: 20000, type: .Travel, goallDate: Date())
        arrayGoal.append(goal1)
        
        let goal2 = GoalModel(name: "ซื้อกองทุนรวม", status: .Unhappy, currentBudget: 500, totalBudget: 6000, type: .Invest, goallDate: Date())
        arrayGoal.append(goal2)
        
        let goal3 = GoalModel(name: "ไปทะเล", status: .Good, currentBudget: 500, totalBudget: 6000, type: .Travel, goallDate: Date())
        arrayGoal.append(goal3)
        
        arrayHomeData.append(arrayGoal)
        
        var arrayOffer = [OfferModel]()
        
        let offer1 = OfferModel(image: "MockupImage", cellUrl: "www.google.com")
        arrayOffer.append(offer1)
        
        let offer2 = OfferModel(image: "MockupImage", cellUrl: "www.google.com")
        arrayOffer.append(offer2)
        
        let offer3 = OfferModel(image: "MockupImage", cellUrl: "www.google.com")
        arrayOffer.append(offer3)
        
        arrayHomeData.append(arrayOffer)
        
        var arraySuggest = [SuggestModel]()
        
        let suggest1 = SuggestModel(image: "MockupImage", cellUrl: "www.google.com")
        arraySuggest.append(suggest1)
        
        let suggest2 = SuggestModel(image: "MockupImage", cellUrl: "www.google.com")
        arraySuggest.append(suggest2)
        
        let suggest3 = SuggestModel(image: "MockupImage", cellUrl: "www.google.com")
        arraySuggest.append(suggest3)
        
        arrayHomeData.append(arraySuggest)
       
        return arrayHomeData
    }
    
    
}
