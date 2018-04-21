//
//  FacultySummaryViewController.swift
//  Smart-Attendance
//
//  Created by student on 4/21/18.
//  Copyright © 2018 Modali,Naga Sravanthi. All rights reserved.
//

import UIKit
import Parse

class FacultySummaryViewController: UIViewController{
//    class FacultySummaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//       return  1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return 1
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func fetch(sender:AnyObject) {
        let query = PFQuery(className:"Attendace")     // Fetches all the Movie objects
        query.findObjectsInBackground {   // what happened to the ( ) ?
            (objects: [PFObject]?, error: Error?) -> Void in
//            if error == nil {
//                // The find succeeded.
//                self.displayOKAlert(title: "Success!",
//                                    message:"Retrieved \(objects!.count) objects.")
//                self.movies = objects as! [Movie]
//                // Do something with the found objects
//                // Like display them in a table view.
//                self.moviesTV.reloadData()
//            } else {
//                // Log details of the failure
//                self.displayOKAlert(title: "Oops", message: “\(error!)")
//            }
            
        }
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
