//
//  EventTableViewCell.swift
//  Event Manager
//
//  Created by Sebastian Banks on 4/1/22.
//

import UIKit

protocol EventTableViewCellDelegate: class {
    func isAttendingButtonTapped(event: Event, isAttending: Bool)
}

class EventTableViewCell: UITableViewCell {
    
    weak var delegate: EventTableViewCellDelegate?
    
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventButton: UIButton!
    
    private var event: Event?
    private var isAttending: Bool = false

    @IBAction func eventButtonTapped(_ sender: Any) {
        guard let event = event else { return }
        isAttending.toggle()
        delegate?.isAttendingButtonTapped(event: event, isAttending: isAttending)
    }
    
    func config(with event: Event) {
        self.event = event
        isAttending = event.isAttending
        eventTitleLabel.text = event.title
        let image = isAttending ? UIImage(systemName: "clock.fill") : UIImage(systemName: "clock")
        eventButton.setImage(image, for: .normal)
    }
}
