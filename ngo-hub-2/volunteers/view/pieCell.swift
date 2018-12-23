//
//  pieCell.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 26/10/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import UIKit
import XJYChart
class pieCell: UITableViewCell , XJYChartDelegate {

    @IBOutlet weak var backView: UIView!
    private var pieChartView: XPieChart?
    var pieItems: [AnyHashable] = []
    let colorArray = [Constants.RGB(145, 235, 253), Constants.RGB(198, 255, 150), Constants.RGB(254, 248, 150), Constants.RGB(253, 210, 147)]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pieChartView = XPieChart()
        let item1 = XPieItem(dataNumber: 20.9, color: colorArray[0], dataDescribe: "")
        pieItems.append(item1!)
        let item2 = XPieItem(dataNumber: 14.82, color: colorArray[1], dataDescribe: "")
        pieItems.append(item2!)
        let item3 = XPieItem(dataNumber: 13.43, color: colorArray[2], dataDescribe: "")
        pieItems.append(item3!)
        let item4 = XPieItem(dataNumber: 52, color: colorArray[3], dataDescribe: "")
        pieItems.append(item4!)
        pieChartView?.dataItemArray = NSMutableArray(array: pieItems)
        pieChartView?.descriptionTextColor = UIColor.black25Percent()
        pieChartView?.delegate = self
        pieChartView?.frame = CGRect(x: 0, y: 0, width: backView.frame.width, height: backView.frame.width)
        
        if let aView = pieChartView {
            backView.addSubview(aView)
            pieChartView?.center = backView.center
        }
    }
    
    func randomColor() -> UIColor? {
        let red = CGFloat(arc4random()) / CGFloat(INT_MAX)
        let green = CGFloat(arc4random()) / CGFloat(INT_MAX)
        let blue = CGFloat(arc4random()) / CGFloat(INT_MAX)
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    func userClicked(onPieIndexItem pieIndex: Int) {
        print("XBarChartDelegate touch Pie At idx \(pieIndex)")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
