//
//  AppDelegate.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 25/10/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //For changing the colour of status bar
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = UIColor(red: 255.0/255.0, green: 76.0/255.0, blue: 139.0/255.0, alpha: 1.0)
        }
        //load country, state, city list from json files
        readCountry()
        readState()
        readCity()
        // Override point for customization after application launch.
        return true
    }
    
    //generate list of countries from countries.json file
    private func readCountry() {
        do {
            
            //reading the json data from countries.json file
            if let file = Bundle.main.url(forResource: "countries", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: NSArray] {
                    let countries = object["countries"]
                    for country in countries!{
                        //print(country)
                        if let dict = country as? NSDictionary{
                            let id : Int = {
                                if let id = dict.value(forKey: "id"){
                                    return id as! Int
                                }
                                return 0
                            }()
                            
                            let name : String = {
                                if let name = dict.value(forKey: "name"){
                                    return name as! String
                                }
                                return ""
                            }()
                            
                            let phoneCode : Int = {
                                if let phoneCode = dict.value(forKey: "phoneCode"){
                                    return phoneCode as! Int
                                }
                                return 0
                            }()
                            
                            let sortname : String = {
                                if let sortname = dict.value(forKey: "sortname"){
                                    return sortname as! String
                                }
                                return ""
                            }()
                            //json object is saved into countryArr 
                            GlobalVariables.countryArr.append(Country(_id: id, _name: name, _phoneCode: phoneCode, _sortName: sortname))
                            
                        }
                    }
                    
                    
                    
                }  else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    //generate list of state from states file
    private func readState() {
        do {
            if let file = Bundle.main.url(forResource: "states", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: NSArray] {
                    let states = object["states"]
                    for state in states!{
                        //print(state)
                        if let dict = state as? NSDictionary{
                            let id : String = {
                                if let id = dict.value(forKey: "id"){
                                    return id as! String
                                }
                                return ""
                            }()
                            
                            let name : String = {
                                if let name = dict.value(forKey: "name"){
                                    return name as! String
                                }
                                return ""
                            }()
                            
                            let country_id : String = {
                                if let country_id = dict.value(forKey: "country_id"){
                                    return country_id as! String
                                }
                                return ""
                            }()
                            GlobalVariables.stateArr.append(State(_id: id, _name: name, _country_id: country_id))
                            
                        }
                    }
                }  else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    //generate list of cities from cities file
    private func readCity() {
        do {
            if let file = Bundle.main.url(forResource: "cities", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: NSArray] {
                    print("jhj" )
                    let cities = object["cities"]
                    for city in cities!{
                        
                        if let dict = city as? NSDictionary{
                            let id : String = {
                                if let id = dict.value(forKey: "id"){
                                    return id as! String
                                }
                                return ""
                            }()
                            
                            let name : String = {
                                if let name = dict.value(forKey: "name"){
                                    return name as! String
                                }
                                return ""
                            }()
                            
                            let state_id : String = {
                                if let country_id = dict.value(forKey: "state_id"){
                                    return country_id as! String
                                }
                                return ""
                            }()
                            GlobalVariables.cityArr.append(City(_id: id, _name: name, _state_id: state_id ))
                            
                        }
                    }
                }  else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

