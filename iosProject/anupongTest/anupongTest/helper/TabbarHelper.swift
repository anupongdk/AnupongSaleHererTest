//
//  TabbarHelper.swift
//  anupongTest
//
//  Created by anupong dorkkunm on 29/6/2565 BE.
//

import UIKit

extension UITabBar {
    
    func showBadge(index:Int) {
        
        let defaults = UserDefaults.standard
        let badge = defaults.integer(forKey: "profileBadge")
        
        
        if let tabItems = self.items {
            let tabItem = tabItems[index]
            
            if badge > 0 {
                tabItem.badgeValue = "\(badge)"
                tabItem.badgeColor = .white
            }else {
                tabItem.badgeValue = ""
                tabItem.badgeColor = .clear
            }
           
            tabItem.setBadgeTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .normal)
        }
    }
    
    func addBadge(index:Int) {
        
        let defaults = UserDefaults.standard
        var badge = defaults.integer(forKey: "profileBadge")
        badge += 1
        defaults.set(badge, forKey: "profileBadge")
        
        if let tabItems = self.items {
            let tabItem = tabItems[index]
            
            if badge > 0 {
                tabItem.badgeValue = "\(badge)"
                tabItem.badgeColor = .white
                
            }else {
                tabItem.badgeValue = ""
                tabItem.badgeColor = .clear
            }
           
            tabItem.setBadgeTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .normal)
        }
    }
    func removeBadge(index:Int) {
        let defaults = UserDefaults.standard
        defaults.set(0, forKey: "profileBadge")
        
        if let tabItems = self.items {
            let tabItem = tabItems[index]
            tabItem.badgeValue = nil
        }
    }
    
 }
