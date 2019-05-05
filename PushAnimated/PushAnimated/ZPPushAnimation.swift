//
//  ZPPushAnimation.swift
//  PushAnimated
//
//  Created by CodeZP on 2019/5/5.
//  Copyright © 2019 CodeZP. All rights reserved.
//

import UIKit

class ZPPushAnimation: NSObject {
    
}


// MARK: -------------
// MARK: 代理
extension ZPPushAnimation: UIViewControllerAnimatedTransitioning {
    // 动画时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    // 动画核心代码
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // 目标VC
        let toVC = transitionContext.viewController(forKey: .to)
        // 源VC
        let fromeVC = transitionContext.viewController(forKey: .from)
        
        let toView = toVC?.view
        let fromeView = fromeVC?.view
        // 将目标控制器view添加到内容
        guard toView != nil && fromeView != nil else {
            return
        }
        let w = UIScreen.main.bounds.size.width;
        let h = UIScreen.main.bounds.size.height;
        toView?.frame = CGRect(x: 0, y: h, width: w, height: h)
        transitionContext.containerView.addSubview(toView!)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            fromeView!.frame = CGRect(x: 20, y: 20, width: w - 40, height: h);
            toView!.frame = CGRect(x: 0, y: 0, width: w, height: h)
        }) { (finish) in
            fromeView!.frame = UIScreen.main.bounds;
            transitionContext.completeTransition(finish)
        }
    }
}
