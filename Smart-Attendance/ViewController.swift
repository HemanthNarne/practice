//
//  ViewController.swift
//  Smart-Attendance
//
//  Created by Modali,Naga Sravanthi on 2/16/18.
//  Copyright © 2018 Modali,Naga Sravanthi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    let role:[String] = ["Faculty", "Student"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return role.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "role_cell")!
        cell.textLabel?.text = role[indexPath.row]
        return cell
    }
    
    @IBOutlet weak var roleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

