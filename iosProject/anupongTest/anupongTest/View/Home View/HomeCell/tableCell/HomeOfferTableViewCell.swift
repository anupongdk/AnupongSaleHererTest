//
//  HomeOfferTableViewCell.swift
//  anupongTest
//
//  Created by anupong dorkkunm on 28/6/2565 BE.
//

import UIKit

class HomeOfferTableViewCell: UITableViewCell {
    var cellData = [Any]()

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblCellHeader: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(UINib(nibName: "HomeOfferCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeOfferCollectionViewCell")
    
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func setUI() {
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension HomeOfferTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeOfferCollectionViewCell", for: indexPath) as! HomeOfferCollectionViewCell
        
        if cellData[indexPath.row] is OfferModel {
            collectionCell.setOfferData(dataObject: cellData[indexPath.row] as! OfferModel)
        }
        
        if cellData[indexPath.row] is SuggestModel {
            collectionCell.setSuggestData(dataObject: cellData[indexPath.row] as! SuggestModel)
        }
        
        return collectionCell
    }
    
    
    
}
