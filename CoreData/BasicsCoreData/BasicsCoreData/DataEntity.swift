//
//  DataEntity.swift
//  BasicsCoreData
//
//  Created by Harish Kumar on 01/04/19.
//  Copyright © 2019 Harish Kumar. All rights reserved.
//
//

import Foundation
import CoreData

@objc(DataEntity)
public class DataEntity: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<DataEntity> {
        return NSFetchRequest<DataEntity>(entityName: "DataEntity")
    }
    
    @NSManaged public var dataAttribute: String?

}
