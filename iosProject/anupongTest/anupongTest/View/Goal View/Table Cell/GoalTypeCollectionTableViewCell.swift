//
//  GoalTypeCollectionTableViewCell.swift
//  anupongTest
//
//  Created by anupong dorkkunm on 29/6/2565 BE.
//

import UIKit

class GoalTypeCollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionMain: UICollectionView!
    var data = [Goaltype]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI(){
        collectionMain.register(UINib(nibName: "GoalTypeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GoalTypeCollectionViewCell")
        collectionMain.delegate = self
        collectionMain.dataSource = self
        collectionMain.isScrollEnabled = false
    }
    
}

extension GoalTypeCollectionTableViewCell: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GoalTypeCollectionViewCell", for: indexPath) as? GoalTypeCollectionViewCell
        cell?.setUI(cellType: data[indexPath.row])
        return cell!
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let itemWH = (screenWidth - (8*6))/3
        return CGSize(width: itemWH, height: itemWH)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    
        return UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
    }


}
