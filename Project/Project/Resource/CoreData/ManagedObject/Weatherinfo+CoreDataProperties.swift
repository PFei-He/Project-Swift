//
//  Weatherinfo+CoreDataProperties.swift
//  Project
//
//  Created by PFei_He on 16/1/6.
//  Copyright © 2016年 PF-Lib. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Weatherinfo {

    @NSManaged var time: String?
    @NSManaged var temp: NSNumber?
    @NSManaged var qy: NSNumber?
    @NSManaged var njd: String?
    @NSManaged var isRadar: NSNumber?
    @NSManaged var cityid: NSNumber?
    @NSManaged var city: String?
    @NSManaged var wse: NSNumber?
    @NSManaged var ws: String?
    @NSManaged var wd: String?
    @NSManaged var sd: String?
    @NSManaged var radar: String?

}
