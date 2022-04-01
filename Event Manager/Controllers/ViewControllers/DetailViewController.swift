//
//  DetailViewController.swift
//  Event Manager
//
//  Created by Sebastian Banks on 4/1/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var createNewEventLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var eventDatePicker: UIDatePicker!
    @IBOutlet weak var saveBarButtonItem: UIBarButtonItem!
    
    var event: Event?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let event = event {
            saveBarButtonItem.title = "Update"
            createNewEventLabel.text = event.title
            titleTextField.text = event.title
            eventDatePicker.date = event.date ?? Date()
        } else {
            createNewEventLabel.text = "Create New Event"
            saveBarButtonItem.title = "Save"
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty else { return }
        
        let date = eventDatePicker.date
        
        if let event = event {
            EventController.shared.updateEvent(event: event, title: title, date: date)
        } else {
            EventController.shared.createEvent(title: title, date: date)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
