//
//  HomeOfferCollectionViewCell.swift
//  AnupongTest
//
//  Created by anupong dorkkunm on 28/6/2565 BE.
//

import UIKit

class HomeOfferCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setOfferData(dataObject:OfferModel) {
        mainImage.image = UIImage(named: dataObject.image)
    }
    
    func setSuggestData(dataObject:SuggestModel) {
        mainImage.image = UIImage(named: dataObject.image)
    }

    
   


}
