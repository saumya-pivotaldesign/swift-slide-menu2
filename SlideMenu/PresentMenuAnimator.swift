//
//  PresentMenuAnimator.swift
//  SlideMenu
//
//  Created by Pivotal on 5/24/16.
//  Copyright © 2016 pivotaldesign.biz. All rights reserved.
//

import Foundation
import UIKit

class PresentMenuAnimator: NSObject {
    //
}

extension PresentMenuAnimator : UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.6
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey),
            let containerView = transitionContext.containerView()
            else {
                return
        }
        // more code goes here
        containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
        //
        let snapshot = fromVC.view.snapshotViewAfterScreenUpdates(false)
        snapshot.tag = MenuHelper.snapshotNumber
        snapshot.userInteractionEnabled = false
        snapshot.layer.shadowOpacity = 0.7
        containerView.insertSubview(snapshot, aboveSubview: toVC.view)
        fromVC.view.hidden = true
        //
        UIView.animateWithDuration(
            transitionDuration(transitionContext),
            animations: {
                snapshot.center.x += UIScreen.mainScreen().bounds.width * MenuHelper.menuWidth
            },
            completion: { _ in
                fromVC.view.hidden = false
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            }
        )
    }
}