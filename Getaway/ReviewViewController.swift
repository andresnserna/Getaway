//
//  ReviewViewController.swift
//  Getaway
//
//  Created by Andrés Serna on 11/12/25.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate
let context = appDelegate.persistentContainer.viewContext

class ReviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var items : [Review] = []
    var destinationName: String?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let reviewerLabel = cell.contentView.viewWithTag(1) as? UILabel
        let reviewTextLabel = cell.contentView.viewWithTag(2) as? UILabel
        
        // Get the review object for this row
        let review = items[indexPath.row]
        
        // Populate the labels using Core Data
        reviewerLabel?.text = review.reviewer ?? "Anonymous"
        reviewTextLabel?.text = "\"\(review.text ?? "")\""
        
        // Allow labels to expand
        reviewerLabel?.numberOfLines = 0
        reviewTextLabel?.numberOfLines = 0
        
        return cell
    }
    

    @IBOutlet weak var tbl_items: UITableView!
    @IBAction func btn_addReview(_ sender: UIButton) {
        // you add the review inside an alert
        let alert = UIAlertController(title: "Add Review", message: nil, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Your name"
        }
        
        alert.addTextField { textField in
            textField.placeholder = "Your review"
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            guard let self = self,
                  let reviewerName = alert.textFields?[0].text,
                  let reviewText = alert.textFields?[1].text else { return }
            
            // Create new review in Core Data
            let newReview = Review(context: context)
            newReview.reviewer = reviewerName
            newReview.text = reviewText
            newReview.date = Date()
            newReview.rating = 5  // You can add UI for this later
            
            // Save context
            do {
                try context.save()
                self.loadReviews()  // Reload the table
            } catch {
                print("Failed to save review: \(error)")
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbl_items.rowHeight = UITableView.automaticDimension
        tbl_items.estimatedRowHeight = 70
        loadReviews()
    }
    
    func loadReviews() {
        let fetchRequest: NSFetchRequest<Review> = Review.fetchRequest()
        
        // Optional: filter by destination if you want
        if let destination = destinationName {
            fetchRequest.predicate = NSPredicate(format: "destination == %@", destination)
        }
        
        do {
            items = try context.fetch(fetchRequest)
            tbl_items.reloadData()
        } catch {
            print("Failed to fetch reviews: \(error)")
        }
    }
    

}
