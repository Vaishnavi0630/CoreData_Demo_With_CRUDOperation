//
//  DataBaseHelper.swift
//  CoreDataDemo
//
//  Created by Admin on 26/06/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class DataBaseHelper {
    
    static var sharedInstance = DataBaseHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    //MARK: save data method
    
    func save(object: [String: String])  {
     
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        
        student.name = object["name"]
        student.address = object["address"]
        student.city = object["city"]
        student.mobile = object["mobile"]
        
        do {
            try context?.save()
        } catch  {
            print("data is not save")
        }
    }
    
    //MARK: fetch data method

    func getData() -> [Student] {
        var student = [Student]()
        
        let fetchrequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        
        do {
            student = try context?.fetch(fetchrequest) as! [Student]
        } catch  {
            print("can not get data")
        }
        
        return student
    }
    
    
    //MARK: delete data method

    func deleteData(index: Int) -> [Student] {
        
        var student = getData()
        
        context?.delete(student[index])
        student.remove(at: index)
        do {
            try context?.save()
        } catch  {
            
            print("cannot delete data")
        }
        
        return student
    }
    
    //MARK: Edit data method
    
    func editData(object:[String:String],editAtIndex: Int)  {
        
        var student = getData()
        
        student[editAtIndex].name = object["name"]
        student[editAtIndex].address = object["address"]
        student[editAtIndex].city = object["city"]
        student[editAtIndex].mobile = object["mobile"]

        do {
            try context?.save()
        } catch  {
            print("data is not edit")
        }
    }
}
