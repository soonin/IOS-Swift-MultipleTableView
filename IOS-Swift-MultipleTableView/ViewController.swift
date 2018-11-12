//
//  ViewController.swift
//  IOS-Swift-MultipleTableView
//
//  Created by Pooya on 2018-11-12.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var topTableView: UITableView!
    @IBOutlet weak var downTableview: UITableView!
    var topData : [String] = []
    var downData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topTableView.delegate = self
        downTableview.delegate = self
        topTableView.dataSource = self
        downTableview.dataSource = self
        
        for index in 0...20 {
            topData.append("Top Table Row \(index)")
        }
        
        for index in 10...45 {
            downData.append("Down Table Row \(index)")
        }

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRow = 1
        switch tableView {
        case topTableView:
            numberOfRow = topData.count
        case downTableview:
            numberOfRow = downData.count
        default:
            print("Some things Wrong!!")
        }
        return numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch tableView {
        case topTableView:
            cell = tableView.dequeueReusableCell(withIdentifier: "topCell", for: indexPath)
            cell.textLabel?.text = topData[indexPath.row]
            cell.backgroundColor = UIColor.green
        case downTableview:
            cell = tableView.dequeueReusableCell(withIdentifier: "downCell", for: indexPath)
            cell.textLabel?.text = downData[indexPath.row]
            cell.backgroundColor = UIColor.yellow
        default:
            print("Some things Wrong!!")
        }
        return cell
    }
    
    

}

