//
//  HomeGoalTableViewCell.swift
//  AnupongTest
//
//  Created by anupong dorkkunm on 28/6/2565 BE.
//

import UIKit

class HomeGoalTableViewCell: UITableViewCell {
    
    var cellActionBlock: (() -> Void)? = nil
    
    @IBOutlet weak var lblTotalGoalBudget: UILabel!
    @IBOutlet weak var lblGoalCount: UILabel!
    @IBOutlet weak var addGoalButton: UIButton!
    var goalData = [Any]()
    @IBOutlet weak var goalCollection: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
     
        goalCollection.register(UINib(nibName: "HomeGoalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeGoalCollectionViewCell")
        
        goalCollection.dataSource = self
        goalCollection.delegate = self
        setUI()
    }
    
    func setData(){
        
        lblGoalCount.text = "\(goalData.count) Goals"
        lblTotalGoalBudget.text = "\(calGoalBudget())"
    }
    
    
   private func setUI() {
       goalCollection.backgroundColor = .none
       addGoalButton.backgroundColor = Colors.appRed
       addGoalButton.layer.cornerRadius = 4
       addGoalButton.setTitleColor(UIColor.white, for: .normal)
       addGoalButton.setTitle("New Goal", for: .normal)
       
    }
    
    @IBAction func didTapGoalButton(_ sender: Any) {
        cellActionBlock?()
    }
    
    
    
    
    private func calGoalBudget()-> Int{
       
        guard let goals = goalData as? [GoalModel] else {
            return 0
        }
        return goals.reduce(0,{$0 + $1.currentBudget})
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension HomeGoalTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return goalData.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeGoalCollectionViewCell", for: indexPath) as! HomeGoalCollectionViewCell
        collectionCell.layer.backgroundColor = UIColor.white.cgColor
        collectionCell.layer.borderColor = Colors.appRed.cgColor
        collectionCell.layer.borderWidth = 1
        collectionCell.layer.cornerRadius = 4
        collectionCell.setData(dataObject: goalData[indexPath.row] as! GoalModel)
        return collectionCell
    }
    
    
    
}
