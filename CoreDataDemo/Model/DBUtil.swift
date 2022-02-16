//
//  DBUtil.swift
//  CoreDataDemo
//
//  Created by SHRIDEVI SAWANT on 07/02/22.
//  Copyright © 2022 comviva. All rights reserved.
//

import Foundation
import UIKit
import CoreData

// 1. managed object context - db operations

let MOContext = ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext)!


func addEmployee(name: String, id: Int, salary: Int, city: String) {
    
    // insert
    let emp = Employee(context: MOContext)
    emp.emp_id = Int64(id)
    emp.empName = name
    emp.city = city
    emp.salary = Int64(salary)
    
    do {
        try MOContext.save()
        print("Inserted a new employee")
    }catch {
        print("Unable to add a employee: \(error.localizedDescription)")
        
        MOContext.delete(emp)
    
    }
    
}

func deleteAllEmp() {
    
    let empList = getEmployees()
    for emp in empList {
        deleteEmp(empToDelete: emp)
    }
    
    print("Deleted all emps")
}

func getEmpFilterByCity(cityName: String) -> [Employee] {
    //
    var empList : [Employee] = []
    
    let fRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
    
    let cityPredicate = NSPredicate(format: "city == %@ ", cityName)
    
    fRequest.predicate = cityPredicate
    
    
    do {
        // query executed select * from Employee where city ==
        empList = try MOContext.fetch(fRequest)
        print("Fetched Count :\(empList.count)")
    }catch {
        print("Unable to fetch data: \(error.localizedDescription)")
    }
    
    return empList
}


func getEmpSortBySalary() -> [Employee] {
    // select * from Employee sortby name
    var empList : [Employee] = []
    
    let fRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
    let nameSortDesc = NSSortDescriptor(key: "salary", ascending: false)
    
    fRequest.sortDescriptors = [nameSortDesc]
    do {
        // query executed
        empList = try MOContext.fetch(fRequest)
        print("Fetched Count :\(empList.count)")
    }catch {
        print("Unable to fetch data: \(error.localizedDescription)")
    }
    
    return empList
}


func getEmpSortByName() -> [Employee] {
    // select * from Employee sortby name
    var empList : [Employee] = []
    
    let fRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
    let nameSortDesc = NSSortDescriptor(key: "empName", ascending: true)
    
    fRequest.sortDescriptors = [nameSortDesc]
    do {
       // query executed
        empList = try MOContext.fetch(fRequest)
        print("Fetched Count :\(empList.count)")
    }catch {
        print("Unable to fetch data: \(error.localizedDescription)")
    }
    
    return empList
}

func getEmployees() -> [Employee]{
    //select
    var empList : [Employee] = []
    
    let fRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
    do {
        // select * from Employee
        empList = try MOContext.fetch(fRequest)
        print("Fetched Count :\(empList.count)")
    }catch {
        print("Unable to fetch data: \(error.localizedDescription)")
    }
    
    return empList
}

func deleteEmp(empToDelete: Employee){
    // delete
    // delete query
    let name = empToDelete.empName ?? ""
    MOContext.delete(empToDelete)
    do {
        try MOContext.save()
        print("Deleted employee: \(name)")
    }catch {
        print("Unable to delete a employee: \(error.localizedDescription)")
    }
    
}
