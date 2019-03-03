//
//  ViewController.swift
//  JsoParsing
//
//  Created by indo gusmas arung samudra on 02/03/19.
//  Copyright © 2019 indo gusmas arung samudra. All rights reserved.
//

import UIKit


struct Course : Decodable {
    let id : Int
    let name : String
    let link : String
    let imageUrl : String
    
    init(json : [String: Any]) {
        id = json["id"] as? Int ?? -1
        name = json["name"] as? String ?? ""
        link = json["link"] as? String ?? ""
        imageUrl = json["imageUrl"] as? String ?? ""
    }
    
    
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let jsonUrlString  = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        
        guard let url = URL(string: jsonUrlString) else
        {return}
        
        URLSession.shared.dataTask(with: url){(data, response, err) in
            guard let data  = data else {return}
            do{
                print("start")
                let course = try
                    JSONDecoder().decode([Course].self, from: data)
                print(course)
                
                //Swift 2/3/ObjC
//             guard let json = try
//                JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:
//                    Any] else {
//                        return
//                }
//                let course = Course(json: json)
//                print(course.name)
            }catch let jsonErr{
                print(jsonErr.localizedDescription)
            }

        }.resume()
    }


}

