//
//  ViewController.swift
//  mapd714-F2019-lesson8
//
//  Created by Student on 2019-10-30.
//  Copyright © 2019 CentennialCollege. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let heroes: [Hero] = [
        Hero(name: "Luke Skywalker", detail: "He uses the force", image: UIImage(named: "star")!),
        Hero(name: "The Black Widow", detail: "from Russia with love", image: UIImage(named: "star")!),
        Hero(name: "Spiderman", detail: "uses webs", image: UIImage(named: "star")!),
        Hero(name: "Batman", detail: "saves world", image: UIImage(named: "star")!),
        Hero(name: "Indiana Jones", detail: "uses whip", image: UIImage(named: "star")!),
        Hero(name: "Rocky Balboa", detail: "He uses the force", image: UIImage(named: "star")!),
        Hero(name: "Conan", detail: "He uses the force", image: UIImage(named: "star")!),
        Hero(name: "Iron Man", detail: "He uses the force", image: UIImage(named: "star")!),
        Hero(name: "Wonder Woman", detail: "He uses the force", image: UIImage(named: "star")!),
        Hero(name: "Captain Marvel", detail: "He uses the force", image: UIImage(named: "star")!)
        ]
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        if (indexPath.row == 0)
        {
            if(cell == nil)
            {
                cell = UITableViewCell(style: .default, reuseIdentifier: simpleTableIdentifier)
            }
            cell?.textLabel?.text = "Heroes"
        }
        else
        {
            if(cell == nil)
            {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: simpleTableIdentifier)
            }
            cell?.imageView?.image = heroes[indexPath.row-1].image
            let highLightedImage = UIImage(named: "star2")
            cell?.imageView?.highlightedImage = highLightedImage
            
            cell?.textLabel?.text = heroes[indexPath.row-1].name
            cell?.detailTextLabel?.text = heroes[indexPath.row-1].detail
            
        }
       
        return cell!
    }
    
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath.row == 0 ? nil : indexPath
    }
 
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let message = "You selected \(heroes[indexPath.row-1].name)"
        let controller = UIAlertController(title: "Row selected", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes, I did.", style: .default, handler: nil)
        
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

