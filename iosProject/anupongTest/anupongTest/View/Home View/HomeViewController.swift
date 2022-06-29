//
//  HomeViewController.swift
//  anupongTest
//
//  Created by anupong dorkkunm on 28/6/2565 BE.
//

import UIKit
import SocketIO

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableHomeContent: UITableView!
    var viewModel = HomeViewModel()
    let manager = SocketManager(socketURL: URL(string: "wss://px-socket-api.herokuapp.com")!, config: [.log(true), .compress])
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupUI()
        socket()
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        bindToViewModel()
        viewModel.getHomeData()
        showBadge()
    }
    
    
    func setupUI() {
        self.navigationController?.isNavigationBarHidden = true
        tableHomeContent.separatorStyle = .none
        tableHomeContent.register(UINib(nibName: "HomeGoalTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeGoalTableViewCell")
        tableHomeContent.register(UINib(nibName: "HomeOfferTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeOfferTableViewCell")
        tableHomeContent.delegate = self
        tableHomeContent.dataSource = self
        
    }

    func reloadTable(){
        tableHomeContent.reloadData()
    }
    
    func updateBadge(){
        let parentTabbar = self.parent?.parent as? UITabBarController
        parentTabbar?.tabBar.addBadge(index: 3)

    }
    
    func showBadge(){
        let parentTabbar = self.parent?.parent as? UITabBarController
        parentTabbar?.tabBar.showBadge(index: 3)
    }
    
    func navigate(){
        let addGoalVc = GoalViewController(nibName: "GoalViewController", bundle: nil)
        self.navigationController?.pushViewController(addGoalVc, animated: true)
        
        //self.presentedViewController?.present(addGoalVc, animated: true)
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

extension HomeViewController {
    
    func bindToViewModel() {
        viewModel.output.homeDataDidChange = homeDataDidChanges()
    }
    
    func homeDataDidChanges() -> (([[Any]]) -> Void) {
        return { [weak self] homeData in
            guard let weakSelf = self else { return }
            weakSelf.reloadTable()
        }
    }
    
    func showAlert() -> ((String) -> Void) {
        return {  [weak self] message in

           // guard let weakSelf = self else { return }
           // weakSelf.showAlert(msg: message)
            
        }
    }
    
}




extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return 350
        case 1:
            return 200
        case 2:
            return 200
            
        default:
            return 1
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.homeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeGoalTableViewCell") as! HomeGoalTableViewCell
            cell.goalData = viewModel.homeData[indexPath.section]
            cell.selectionStyle = .none
            cell.setData()
            cell.cellActionBlock = {
                self.navigate()
            }
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeOfferTableViewCell") as! HomeOfferTableViewCell
            cell.lblCellHeader.text = "Best Offer"
            cell.cellData = viewModel.homeData[indexPath.section]
            cell.selectionStyle = .none
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeOfferTableViewCell") as! HomeOfferTableViewCell
            cell.lblCellHeader.text = "Suggest for you"
            cell.cellData = viewModel.homeData[indexPath.section]
            cell.selectionStyle = .none
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
    
    
    
    
}


extension HomeViewController {
    
    func socket() {
       
        let socket = manager.defaultSocket

        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected")
        }
        
        socket.on("new-notification") {data, ack in
            self.updateBadge()
        }

        socket.connect()
        
    }
    
}
