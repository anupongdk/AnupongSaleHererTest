//
//  GoalViewController.swift
//  anupongTest
//
//  Created by anupong dorkkunm on 28/6/2565 BE.
//

import UIKit

class GoalViewController: UIViewController {
    var viewModel = GoalViewModel()
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var tableMain: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        setUI()
        binding()
        viewModel.getGoalFormData()
        // Do any additional setup after loading the view.
        setKeyboardObserve()
        hideKeyboardWhenTappedAround()
    }
    deinit {
        removeKeyboardObserve()
    }
    
    
    func setUI(){
        self.view.backgroundColor = Colors.appLightOrange
        tableMain.register(UINib(nibName: "GoalInputTableViewCell", bundle: nil), forCellReuseIdentifier: "GoalInputTableViewCell")
        tableMain.register(UINib(nibName: "GoalTypeCollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "GoalTypeCollectionTableViewCell")
        tableMain.delegate = self
        tableMain.dataSource = self
        tableMain.separatorStyle = .none
    }
    

    func reloadView(){
        tableMain.reloadData()
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
extension GoalViewController {
    
    func binding(){
        viewModel.output.goalViewDataDidChange = goalViewDataDidChanges()
    }
    
    func goalViewDataDidChanges() -> ((Any) -> Void) {
        return { [weak self] goalData in
            guard let weakSelf = self else { return }
            weakSelf.reloadView()
        }
    }
}



extension GoalViewController:UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension GoalViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (indexPath.section == 0){
            let screenWidth: CGFloat = UIScreen.main.bounds.width
            let itemWH = (screenWidth - (8*6))/3
            return itemWH*2+(8*3)
        }
        return 60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.goalFormData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            return 1
        }
        
        let goalMenu = viewModel.goalFormData[section] as? GoalFormMenu
        return goalMenu?.data.count ?? 0
        
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let goalMenu = viewModel.goalFormData[section] as? GoalFormMenu
        return goalMenu?.name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let goalMenu = viewModel.goalFormData[indexPath.section] as? GoalFormMenu
        
        switch indexPath.section{
        case 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "GoalTypeCollectionTableViewCell") as? GoalTypeCollectionTableViewCell
            cell?.selectionStyle = .none
            cell?.data = goalMenu?.data as? [Goaltype] ?? [Goaltype]()
            cell?.setUI()
            return cell ?? UITableViewCell()
            
        case 1 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "GoalInputTableViewCell") as? GoalInputTableViewCell
            cell?.selectionStyle = .none
            let data =  goalMenu?.data as? [GoalTextMenu] ?? [GoalTextMenu]()
            let menuData = data[indexPath.row]
            cell?.setUI(menu: menuData)
            return cell ?? UITableViewCell()
            
        case 2 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "GoalInputTableViewCell") as? GoalInputTableViewCell
            cell?.selectionStyle = .none
            let data =  goalMenu?.data as? [GoalTextMenu] ?? [GoalTextMenu]()
            let menuData = data[indexPath.row]
            cell?.setUI(menu: menuData)
            return cell ?? UITableViewCell()
            
        default:
            return UITableViewCell()
        }
        
    }
    
    
    
}

extension GoalViewController {
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let userinfo = notification.userInfo else {
            return
        }

        guard
            let duration = (userinfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue,
            let endFrame = (userinfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let curveOption = userinfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {
                return
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: [.beginFromCurrentState, .init(rawValue: curveOption)], animations: {
            let edgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: endFrame.height, right: 0)
            self.tableMain.contentInset = edgeInsets
            self.tableMain.scrollIndicatorInsets = edgeInsets
        })
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        guard let userinfo = notification.userInfo else {
            return
        }

        guard
            let duration = (userinfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue,
            let curveOption = userinfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {
                return
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: [.beginFromCurrentState, .init(rawValue: curveOption)], animations: {
            let edgeInsets = UIEdgeInsets.zero
            self.tableMain.contentInset = edgeInsets
            self.tableMain.scrollIndicatorInsets = edgeInsets
        })
    }

    
    
}



extension GoalViewController {
    func setKeyboardObserve(){
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIWindow.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIWindow.keyboardWillHideNotification, object: nil)
    }
    func removeKeyboardObserve(){
            NotificationCenter.default.removeObserver(self, name: UIWindow.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIWindow.keyboardWillHideNotification, object: nil)
    }
}
