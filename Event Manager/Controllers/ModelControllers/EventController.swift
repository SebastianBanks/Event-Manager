//
//  EventController.swift
//  Event Manager
//
//  Created by Sebastian Banks on 4/1/22.
//

import Foundation
import CoreData

class EventController {
    
    static let shared = EventController()
    
    private init() {}
    
    private lazy var fetchRequest: NSFetchRequest<Event> = {
        let request = NSFetchRequest<Event>(entityName: "Event")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    var events: [Event] = []
    
    func createEvent(title: String, date: Date) {
        let newEvent = Event(title: title, date: date)
        events.append(newEvent)
        CoreDataStack.saveContext()
    }
    
    func fetchEvents() {
        let fetchedEvents = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        events = fetchedEvents
    }
    
    func updateEvent(event: Event, title: String, date: Date) {
        event.title = title
        event.date = date
        CoreDataStack.saveContext()
    }
    
    func isAttendingToggled(event: Event, isAttending: Bool) {
        event.isAttending = isAttending
        CoreDataStack.saveContext()
    }
    
    func deleteEvent(_ event: Event) {
        if let index = events.firstIndex(of: event) {
            events.remove(at: index)
        }
        CoreDataStack.context.delete(event)
        CoreDataStack.saveContext()
    }
}
