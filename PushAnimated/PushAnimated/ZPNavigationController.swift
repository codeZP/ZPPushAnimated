//
//  ZPNavigationController.swift
//  PushAnimated
//
//  Created by CodeZP on 2019/5/5.
//  Copyright © 2019 CodeZP. All rights reserved.
//

import UIKit

class ZPNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.barTintColor = UIColor.orange
        
        weak var weakself = self
        if self.responds(to: #selector(getter: interactivePopGestureRecognizer)) {
            self.interactivePopGestureRecognizer?.delegate = weakself
        }
    } 

}

extension ZPNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == self.interactivePopGestureRecognizer {
            if self.viewControllers.count < 2 || self.visibleViewController == self.viewControllers.first {
                return false
            }
        }
        return true
    }
}
