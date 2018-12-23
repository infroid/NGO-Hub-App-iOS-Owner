//
//  volunteerVC.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 26/10/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import UIKit
import Parchment
class volunteerVC: UIViewController {
   
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleView: UIView!{
        didSet{
            titleView.backgroundColor = UIColor(rgb: 0xFF4C8B)
            
        }
    }

    @IBAction func sideMenuBtn(_ sender: Any) {
        let revealController = self.revealViewController() as! RevealViewController
        revealController.reveal(sender as AnyObject)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationController?.isNavigationBarHidden = true
        let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "activityVC")
        let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "stateVC")
        let viewControllers = [child_1,child_2]
        let pagingViewController = FixedPagingViewController(viewControllers: viewControllers)
        addChildViewController(pagingViewController)
        containerView.addSubview(pagingViewController.view)
        containerView.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParentViewController: self)
        pagingViewController.indicatorColor = UIColor(rgb: 0xFF4C8B)
        pagingViewController.selectedTextColor = UIColor(rgb: 0xFF4C8B)
        // Do any additional setup after loading the view.
    }

   
   
   

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

