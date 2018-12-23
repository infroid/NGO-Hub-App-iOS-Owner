

import UIKit


class menuVC: UIViewController, UITableViewDelegate, UITableViewDataSource  {
   
    var revealController: RevealViewController?
    var profileImg: UIImage! = UIImage(named: "man.png")
    var userName: String! = "Psycho"
    let title1 = ["Requests","Volunteers","Reach Out", "Leader Board"]
    let title2 = ["Log Out"]
    let imageArr = [["home.png","group","message", "leaderboard"],["exit.png"]]
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //for loading the locally saved profile image
        if let imgData = UserDefaults.standard.value(forKey: "Profile_Image") as? Data{
            profileImg = UIImage(data: imgData)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "update_image"), object: nil)
        revealController = self.revealViewController() as? RevealViewController
        tableView.register(UINib(nibName: "cell1", bundle: nil), forCellReuseIdentifier: "cell1")
        tableView.register(UINib(nibName: "cell2", bundle: nil), forCellReuseIdentifier: "cell2")
        tableView.register(UINib(nibName: "headerCell", bundle: nil), forCellReuseIdentifier: "headerCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        tableView.sectionFooterHeight = 0
        tableView.delegate=self
        tableView.dataSource=self
    }
    //loadList invoke when profile image is changed
    @objc func loadList(notification: NSNotification){
        
            if let image = notification.userInfo?["image"] as? UIImage {
                profileImg = image
                tableView.reloadData()
            }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else if section == 1{
            return title1.count
        }else if section == 2{
            return title2.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return UITableViewAutomaticDimension;
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2 {
        return UITableViewAutomaticDimension
        }
        else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section{
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as? headerCell{
                cell.headerLabel.text = "Logout"
                return cell
            }
        
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let navController = UINavigationController()
        let revealController = SWRevealViewController()
        revealController.rightViewController = navController
        revealController.revealToggle(animated: true)
    revealController.rightViewController.view.addGestureRecognizer(revealController.panGestureRecognizer())
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as? cell1{
                cell.userImage.image = profileImg
//                let name = UserDefaults.standard.value(forKey: "name") as? String
                cell.userNameLabel.text = "psycho"
                return cell
            }
        }
        else if indexPath.section == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as? cell2 {
                cell.iconImage.image  = UIImage(named: imageArr[indexPath.section - 1 ][indexPath.row])
                cell.iconImage.setImageColor(color: UIColor.darkGray)
                cell.titleLabel.text = title1[indexPath.row]
                return cell
            }
        }
        else if indexPath.section == 2 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as? cell2 {
                cell.iconImage.image  = UIImage(named: imageArr[indexPath.section - 1][indexPath.row])
                cell.iconImage.setImageColor(color: UIColor.darkGray)
                cell.titleLabel.text = title2[indexPath.row]
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    // for navigating btw different pages
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var controller: UIViewController!
        var navController : UINavigationController!
        if indexPath.section == 0{
            if indexPath.row == 0 {
                controller = storyboard.instantiateViewController(withIdentifier: "profileVC") as! profileVC
                
                navController = UINavigationController(rootViewController: controller)
                revealController = self.revealViewController() as? RevealViewController
                revealController?.rightViewController = navController
                revealController?.reveal(self)
                revealController?.rightViewController.view.addGestureRecognizer((revealController?.panGestureRecognizer())!)
            }
        }
        else if indexPath.section == 1{
            switch indexPath.row{
                case 0:
                    controller = storyboard.instantiateViewController(withIdentifier: "homeVC") as! homeVC
                    navController = UINavigationController(rootViewController: controller)
                    revealController = self.revealViewController() as? RevealViewController
                    revealController?.rightViewController = navController
                    revealController?.reveal(self)
                revealController?.rightViewController.view.addGestureRecognizer((revealController?.panGestureRecognizer())!)
            case 1:
                controller = storyboard.instantiateViewController(withIdentifier: "volunteerVC") as! volunteerVC
                navController = UINavigationController(rootViewController: controller)
                revealController = self.revealViewController() as? RevealViewController
                revealController?.rightViewController = navController
                revealController?.reveal(self)
                revealController?.rightViewController.view.addGestureRecognizer((revealController?.panGestureRecognizer())!)
            case 2:
                controller = storyboard.instantiateViewController(withIdentifier: "reachOutVC") as! reachOutVC
                navController = UINavigationController(rootViewController: controller)
                revealController = self.revealViewController() as? RevealViewController
                revealController?.rightViewController = navController
                revealController?.reveal(self)
                revealController?.rightViewController.view.addGestureRecognizer((revealController?.panGestureRecognizer())!)
            case 3:
                controller = storyboard.instantiateViewController(withIdentifier: "leaderboardVC") as! leaderboardVC
                navController = UINavigationController(rootViewController: controller)
                revealController = self.revealViewController() as? RevealViewController
                revealController?.rightViewController = navController
                revealController?.reveal(self)
                revealController?.rightViewController.view.addGestureRecognizer((revealController?.panGestureRecognizer())!)
                default:
                    print("Invalid Case")
                }
            
        }else if indexPath.section == 2{
            switch indexPath.row{
            case 0:
                logout()
            default:
                print("Invalid Case")
            }
        }
        
    }
    //logout() - for logging out the current user
    func logout(){
        print("logout")
        // reset the locally saved data
        //implement api here
        UserDefaults.standard.set(nil, forKey: "email")
        UserDefaults.standard.set(nil, forKey: "name")
        performSegue(withIdentifier: "logout", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



