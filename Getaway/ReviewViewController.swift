//
//  ReviewViewController.swift
//  Getaway
//
//  Created by Andrés Serna on 11/12/25.
//

import UIKit

var items : [String] = []

class ReviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //style the cell with the data loaded into it
        return cell
    }
    

    @IBOutlet weak var tbl_items: UITableView!
    @IBOutlet weak var lbl_username: UILabel!
    @IBAction func btn_addReview(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
