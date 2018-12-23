//
//  service.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 18/11/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import UIKit

class Service: NSObject {

    //contains functions to implememnt api callback
     static let shared = Service()
    
    func fetchNgo(completion: @escaping([Request]?, Error?) -> ()){
    
    DispatchQueue.main.async {
    var requests = [Request]()
    requests.append(Request(title: "Help Age India", description: "The non-governmental organisation Help Age India has come up into establishment back in the year 1978 where it works under the sole leadership of Mr. Samson Daniel, Mr. Jackson Kole, and Sri Sarvapalli Radhakrishnan. They work for the well-being of aged and elderly people who are deprived by their children and grandchildren in an improper way. The foundation is stationed with its headquarters in the capital city called Delhi.", image: UIImage(named: "helpageindia.jpg")!))
    requests.append(Request(title: "Smile", description: "The non-governmental organisation Smile Foundation has come up into establishment back in the year 2002 where it also works for the child’s right extensively in major cities of India. The foundation is stationed with its headquarters in the capital city called Delhi. They provide guidance to poor unprivileged children to exercise their freedom, make their own choices and to ensure them they get a better life and a better living in the present as well as in the future. They seek to offer better learning, education, and a better life for the well-being of poor children who are lying backward in grasping opportunities and special education. They are also working with the disabilities of the various evil concept of child labor from our country significantly.", image: UIImage(named: "smile.png")!))
    requests.append(Request(title: "Goonj", description: "The non-governmental organization Goonj Limited has come up into establishment back in the year 1999 under the leadership of a journalist named as Anish Gupta. The foundation basically works in collecting clothes for the poor children of our society who basically live on the street with no proper clothing wear. The foundation is stationed with its headquarters in the capital city called Delhi. It has also come up with new ideas of bringing cotton pads for the women who live in rural and as well as in urban slums.", image: UIImage(named: "goonj.png")!))
    requests.append(Request(title: "Cry", description: "The non-governmental organisation Cry has come up into establishment back in the year 1979 where it significantly works for the millions of unprivileged children to reduce the impact of workload on children at a very young age. The foundation works under the leadership of Mr. Rippan Kapoor who is the sole founder of this NGO. The foundation follows the remarkable slogan of ‘Stand up what is right’. Thus, its main objective focus on child’s right and its headquarters stationed in Mumbai, Maharashtra and along with other regional offices in the metro cities of Kolkata, Bengaluru, Chennai, and Delhi as well.", image: UIImage(named: "cry.jpeg")!))
    requests.append(Request(title: "Give India", description: "The non-governmental organisation Give India has come up into establishment back in the year 1999 which said to be the India’s largest donation platform from all over the world independently. It independently collects donations from other reforms to support a cause which signifies transparency and credibility to a large extent significantly. It significantly works as fundraising foundation to reach out to the people in wide extent anywhere in the world.", image: UIImage(named: "giveindia.png")!))
    requests.append(Request(title: "Nanhi Kali", description: "The non-governmental organisation Nanhi Kali has come up into establishment back in the year 1996 for the empowerment of girl children in our society who are deprived of the rightful privileged of education and living to eradicate the maximum level of illiteracy. The sole leadership of this Nanhi Kali foundation is said to be Mr. Anand Mahindra. It has established a successive growth in educating the girl child in a maximum number of about more than 5000 girl child in our country widely. The Nanhi Kali foundation has its stationed headquarters in Mumbai, Maharashtra.", image: UIImage(named: "nanhi.png")!))
        requests.append(Request(title: "Sargam Sanstha", description: "The non-governmental organisation Sargam Sanstha has come up into establishment back in the year 1986 which has worked efficiently in the quality education of the deprived children of the society widely. They have aided them with proper education and learning facility for the wide spectrum of each child who are deprived from the power of education. The regional offices of Sargam Sanstha can be significantly found in the states of Uttar Pradesh.", image: UIImage(named: "sargam.jpg")!))
        requests.append(Request(title: "Sammaan Foundation", description: "The non-governmental organisation Sammaan Foundation has come up into establishment back in the year 2007 which ensures a better living for the people of our society extensively. They work for the unprivileged people who are sadly lie below the poverty line. They aid help to fetch the poor people some significant amount by developing proper skill through various practice and learning sessions. The Sammaan Foundation is stationed with headquarters in the state of Bihar and Patna.", image: UIImage(named: "samman.png")!))
        requests.append(Request(title: "Pratham", description: "The non-governmental organisation Pratham has come up into establishment back in the year 1994 which have worked with the vision of empowering millions of dreams in India especially among the little children of our country. It provides aids for the unprivileged children of our society to give them maximum education and reduce the rate of illiteracy in India in a significant way. The established regional office is stationed in Mumbai, Maharashtra where it mainly aims at school children to provide them with better learning and quality education.", image: UIImage(named: "pratham.png")!))
        requests.append(Request(title: "Lepra Society", description: "The non-governmental organisation Lepra Society has come up into establishment back in the year 1989 with the aid to eradicate the poverty level, against indiscrimination, and provide better health development widely. It also rightfully stands against the deadly disease called leprosy which has caused severe health issue and death among the people in India. The NGO is stationed with its headquarters held in the state of Andhra Pradesh. It also spread its social awareness and helps relief in other states like M.P., Bihar, and Jharkhand.", image: UIImage(named: "lepra.jpg")!))
        requests.append(Request(title: "Help Age India", description: "The non-governmental organisation Help Age India has come up into establishment back in the year 1978 where it works under the sole leadership of Mr. Samson Daniel, Mr. Jackson Kole, and Sri Sarvapalli Radhakrishnan. They work for the well-being of aged and elderly people who are deprived by their children and grandchildren in an improper way. The foundation is stationed with its headquarters in the capital city called Delhi.", image: UIImage(named: "helpageindia.jpg")!))
        requests.append(Request(title: "Smile", description: "The non-governmental organisation Smile Foundation has come up into establishment back in the year 2002 where it also works for the child’s right extensively in major cities of India. The foundation is stationed with its headquarters in the capital city called Delhi. They provide guidance to poor unprivileged children to exercise their freedom, make their own choices and to ensure them they get a better life and a better living in the present as well as in the future. They seek to offer better learning, education, and a better life for the well-being of poor children who are lying backward in grasping opportunities and special education. They are also working with the disabilities of the various evil concept of child labor from our country significantly.", image: UIImage(named: "smile.png")!))
        requests.append(Request(title: "Goonj", description: "The non-governmental organization Goonj Limited has come up into establishment back in the year 1999 under the leadership of a journalist named as Anish Gupta. The foundation basically works in collecting clothes for the poor children of our society who basically live on the street with no proper clothing wear. The foundation is stationed with its headquarters in the capital city called Delhi. It has also come up with new ideas of bringing cotton pads for the women who live in rural and as well as in urban slums.", image: UIImage(named: "goonj.png")!))
        requests.append(Request(title: "Cry", description: "The non-governmental organisation Cry has come up into establishment back in the year 1979 where it significantly works for the millions of unprivileged children to reduce the impact of workload on children at a very young age. The foundation works under the leadership of Mr. Rippan Kapoor who is the sole founder of this NGO. The foundation follows the remarkable slogan of ‘Stand up what is right’. Thus, its main objective focus on child’s right and its headquarters stationed in Mumbai, Maharashtra and along with other regional offices in the metro cities of Kolkata, Bengaluru, Chennai, and Delhi as well.", image: UIImage(named: "cry.jpeg")!))
        requests.append(Request(title: "Give India", description: "The non-governmental organisation Give India has come up into establishment back in the year 1999 which said to be the India’s largest donation platform from all over the world independently. It independently collects donations from other reforms to support a cause which signifies transparency and credibility to a large extent significantly. It significantly works as fundraising foundation to reach out to the people in wide extent anywhere in the world.", image: UIImage(named: "giveindia.png")!))
        requests.append(Request(title: "Nanhi Kali", description: "The non-governmental organisation Nanhi Kali has come up into establishment back in the year 1996 for the empowerment of girl children in our society who are deprived of the rightful privileged of education and living to eradicate the maximum level of illiteracy. The sole leadership of this Nanhi Kali foundation is said to be Mr. Anand Mahindra. It has established a successive growth in educating the girl child in a maximum number of about more than 5000 girl child in our country widely. The Nanhi Kali foundation has its stationed headquarters in Mumbai, Maharashtra.", image: UIImage(named: "nanhi.png")!))
        requests.append(Request(title: "Sargam Sanstha", description: "The non-governmental organisation Sargam Sanstha has come up into establishment back in the year 1986 which has worked efficiently in the quality education of the deprived children of the society widely. They have aided them with proper education and learning facility for the wide spectrum of each child who are deprived from the power of education. The regional offices of Sargam Sanstha can be significantly found in the states of Uttar Pradesh.", image: UIImage(named: "sargam.jpg")!))
        requests.append(Request(title: "Sammaan Foundation", description: "The non-governmental organisation Sammaan Foundation has come up into establishment back in the year 2007 which ensures a better living for the people of our society extensively. They work for the unprivileged people who are sadly lie below the poverty line. They aid help to fetch the poor people some significant amount by developing proper skill through various practice and learning sessions. The Sammaan Foundation is stationed with headquarters in the state of Bihar and Patna.", image: UIImage(named: "samman.png")!))
        requests.append(Request(title: "Pratham", description: "The non-governmental organisation Pratham has come up into establishment back in the year 1994 which have worked with the vision of empowering millions of dreams in India especially among the little children of our country. It provides aids for the unprivileged children of our society to give them maximum education and reduce the rate of illiteracy in India in a significant way. The established regional office is stationed in Mumbai, Maharashtra where it mainly aims at school children to provide them with better learning and quality education.", image: UIImage(named: "pratham.png")!))
        requests.append(Request(title: "Lepra Society", description: "The non-governmental organisation Lepra Society has come up into establishment back in the year 1989 with the aid to eradicate the poverty level, against indiscrimination, and provide better health development widely. It also rightfully stands against the deadly disease called leprosy which has caused severe health issue and death among the people in India. The NGO is stationed with its headquarters held in the state of Andhra Pradesh. It also spread its social awareness and helps relief in other states like M.P., Bihar, and Jharkhand.", image: UIImage(named: "lepra.jpg")!))
    completion(requests, nil)
    }
    //let urlString = ""
    //guard let url = URL(string: urlString) else { return }
    }
    
    func fetchRequests(completion: @escaping([Request]?, Error?) -> ()){
        
        DispatchQueue.main.async {
             var requests = [Request]()
            requests.append(Request(title: "Deforestation in Ghaziabad", description: "The environment impact assessment report for the projects around south Delhi shows that over 16,000 trees will be cut in seven areas, including Sarojini Nagar, Nauroji nagar and Netaji Nagar.", image: UIImage(named: "deforestation.jpeg")!))
            requests.append(Request(title: "Deforestation in Ghaziabad", description: "The environment impact assessment report for the projects around south Delhi shows that over 16,000 trees will be cut in seven areas, including Sarojini Nagar, Nauroji nagar and Netaji Nagar.", image: UIImage(named: "deforestation.jpeg")!))
            requests.append(Request(title: "Deforestation in Ghaziabad", description: "The environment impact assessment report for the projects around south Delhi shows that over 16,000 trees will be cut in seven areas, including Sarojini Nagar, Nauroji nagar and Netaji Nagar.", image: UIImage(named: "deforestation.jpeg")!))
            requests.append(Request(title: "Deforestation in Ghaziabad", description: "The environment impact assessment report for the projects around south Delhi shows that over 16,000 trees will be cut in seven areas, including Sarojini Nagar, Nauroji nagar and Netaji Nagar.", image: UIImage(named: "deforestation.jpeg")!))
            requests.append(Request(title: "Deforestation in Ghaziabad", description: "The environment impact assessment report for the projects around south Delhi shows that over 16,000 trees will be cut in seven areas, including Sarojini Nagar, Nauroji nagar and Netaji Nagar.", image: UIImage(named: "deforestation.jpeg")!))
            requests.append(Request(title: "Deforestation in Ghaziabad", description: "The environment impact assessment report for the projects around south Delhi shows that over 16,000 trees will be cut in seven areas, including Sarojini Nagar, Nauroji nagar and Netaji Nagar.", image: UIImage(named: "deforestation.jpeg")!))
            completion(requests, nil)
        }
        //let urlString = ""
        //guard let url = URL(string: urlString) else { return }
    }
    
    func fetchPrimaryDetails(completion: @escaping(PrimaryDetails?, Error?) -> ()){
        
        DispatchQueue.main.async {
            let primaryDetail = PrimaryDetails(name: "Kunwar Anirudh Singh", email: "kunwar@gmail.com", purpose: "To free india", description: "To free india from corruption", country: "India", state: "Uttar Pradesh", city: "Ghaziabad", primaryPhone: "+911234567890", secondaryPhone: "+910987654321", website: "www.google.com", userImg: UIImage(named: "sam.png")!)
            completion(primaryDetail, nil)
        }
        //let urlString = ""
        //guard let url = URL(string: urlString) else { return }
    }
    
}
