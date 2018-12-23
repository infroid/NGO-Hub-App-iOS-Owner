//
//  profileVC.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 27/10/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import UIKit
import Parchment


class profileVC: UIViewController {
   
    
    @IBOutlet weak var titleView: UIView!{
        didSet{
            titleView.backgroundColor = UIColor(rgb: 0xFF4C8B)
        }
    }
    // containerView - display primary profile and secondary profile sections
    @IBOutlet weak var containerView: UIView!
    
    // sideMenuBtn - toggle side menu
    @IBAction func sideMenuBtn(_ sender: Any) {
        let revealController = self.revealViewController() as! RevealViewController
        revealController.reveal(sender as AnyObject)
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "primaryVC")
        let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondaryVC")
        let viewControllers = [child_1,child_2]
        //Parchment pod is used for paging view controllers
        let pagingViewController = FixedPagingViewController(viewControllers: viewControllers)
        addChildViewController(pagingViewController)
        containerView.addSubview(pagingViewController.view)
        containerView.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParentViewController: self)
        pagingViewController.indicatorColor = UIColor(rgb: 0xFF4C8B)
        pagingViewController.selectedTextColor = UIColor(rgb: 0xFF4C8B)
        // Do any additional setup after loading the view.
    }

    
    
    
   

}
