//
//  ArchievementViewController.swift
//  anupongTest
//
//  Created by anupong dorkkunm on 28/6/2565 BE.
//

import UIKit

class ArchievementViewController: UIViewController {

    @IBOutlet weak var mainCollectionContentView: UICollectionView!
    var viewModel = ArchievementViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
        binding()
        viewModel.getArchievementData()
       
    }
    
    func setUI(){
        self.view.backgroundColor = Colors.appLightOrange
        mainCollectionContentView.register(UINib(nibName: "ArchievementCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ArchievementCollectionViewCell")
        mainCollectionContentView.allowsSelection = false
        mainCollectionContentView.delegate = self
        mainCollectionContentView.dataSource = self
        
    }
    
    
    func reloadView(){
        mainCollectionContentView.reloadData()
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}


extension ArchievementViewController {
    
    func binding(){
        viewModel.output.archievementDataDidChange = archievementDataDidChanges()
    }
    
    
    func archievementDataDidChanges()->((ArchievementModel) -> Void){
        return { [weak self] archievementData in
            guard let weakSelf = self else { return }
            weakSelf.reloadView()
        }
    }
    
}

extension ArchievementViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.archievementData.badgeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArchievementCollectionViewCell", for: indexPath) as! ArchievementCollectionViewCell
        
        cell.setUI(data: viewModel.archievementData.badgeList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    
        return UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let itemWH = (screenWidth - (8*6))/3
        return CGSize(width: itemWH, height: itemWH)
    }
    
    
}
