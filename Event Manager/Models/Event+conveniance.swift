//
//  Even+conveniance.swift
//  Event Manager
//
//  Created by Sebastian Banks on 4/1/22.
//

import Foundation
import CoreData

extension Event {
    @discardableResult convenience init(title: String, date: Date, isAttending: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        self.title = title
        self.date = date
        self.isAttending = isAttending
    }
    
}
