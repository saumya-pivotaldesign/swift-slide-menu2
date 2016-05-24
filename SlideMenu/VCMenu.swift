//
//  VCMenu.swift
//  SlideMenu
//
//  Created by Pivotal on 5/24/16.
//  Copyright © 2016 pivotaldesign.biz. All rights reserved.
//

import UIKit

class VCMenu : UIViewController {
    // 1
    var interactor:Interactor? = nil
    // 2
    @IBAction func handleGesture(sender: UIPanGestureRecognizer) {
        // 3
        let translation = sender.translationInView(view)
        // 4
        let progress = MenuHelper.calculateProgress(
            translation,
            viewBounds: view.bounds,
            direction: .Left
        )
        // 5
        MenuHelper.mapGestureStateToInteractor(
            sender.state,
            progress: progress,
            interactor: interactor){
                // 6
                self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func closeMenu(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}