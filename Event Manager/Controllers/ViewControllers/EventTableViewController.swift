//
//  EventTableViewController.swift
//  Event Manager
//
//  Created by Sebastian Banks on 4/1/22.
//

import UIKit

class EventTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        EventController.shared.fetchEvents()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EventController.shared.events.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as? EventTableViewCell else {
            return UITableViewCell()
        }
        
        let event = EventController.shared.events[indexPath.row]
        cell.config(with: event)
        cell.delegate = self
        // Configure the cell...

        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let event = EventController.shared.events[indexPath.row]
            EventController.shared.deleteEvent(event)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "eventSeque",
            let indexPath = tableView.indexPathForSelectedRow,
                let destination = segue.destination as? DetailViewController {
                    let event = EventController.shared.events[indexPath.row]
                    destination.event = event
            
        }
    }
    

}

extension EventTableViewController: EventTableViewCellDelegate {
    func isAttendingButtonTapped(event: Event, isAttending: Bool) {
        EventController.shared.isAttendingToggled(event: event, isAttending: isAttending)
        tableView.reloadData()
    }
}
