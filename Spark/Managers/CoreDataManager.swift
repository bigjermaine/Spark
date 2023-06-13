//
//  CoreDataManager.swift
//  Spark
//
//  Created by Apple on 13/06/2023.
//

import Foundation

import Foundation
import CoreData
import SwiftUI



struct User {
    let name:String
    let phoneNumber:String
    let userName:String
    let email:String
    
    
}

class UserCoredataViewModel:ObservableObject {
    
    ///Create the container of the coredaata
    let container:NSPersistentContainer
    @Published var savedEntity: [UserEntity] = []
    let userEmail = UserDefaults.standard.string(forKey: "email")
    @Published var user:User?
    init(){
     ///container of coredata like a storage unit
        container = NSPersistentContainer(name: "CoreData1")
        container.loadPersistentStores { description, error in
            if let error = error  {
                print(error.localizedDescription)
            }else {
                print("sucess")
            }
        }
     
        fetchbooking()
       
       
      
    }
    ///fetch the request
    func fetchbooking() {
        let request =  NSFetchRequest<UserEntity>(entityName:"UserEntity")
        
        
        do{
            savedEntity = try container.viewContext.fetch(request)
        }catch let error {
            print(error.localizedDescription)
        }
        
    }
    ///add the booking
    func addBooking(Name:String,phonenumber:String,username:String,email:String) {
        let newBooking = UserEntity(context: container.viewContext)
        newBooking.name = Name
        newBooking.phonenumber = phonenumber
        newBooking.email = email
        newBooking.username = username
        saveBooking()
    }
    
    func retrieveUserDetails(email: String)  {
        print("nil\(email)")
        let fetchRequest = NSFetchRequest<UserEntity>(entityName: "UserEntity")
        fetchRequest.predicate = NSPredicate(format: "username == %@", email)
        
        do {
            let users = try container.viewContext.fetch(fetchRequest)
            if let userEntity = users.first {
                guard let name = userEntity.name,
                      let phoneNumber = userEntity.phonenumber,
                      let username = userEntity.username,
                      let email = userEntity.email else {
                    print("User details contain nil values.")
                  return
                }
                DispatchQueue.main.async {
                    let user = User(name: name, phoneNumber: phoneNumber, userName: username, email: email)
                    self.user = user
                    print(user)
                }
               
            } else {
                print("No user entity found with the email: \(email)")
            }
        } catch {
            print("Failed to retrieve user details: \(error.localizedDescription)")
        }
        
       
    }

    ///delete the Delete
    func delete(index:IndexSet) {
        guard let index = index.first else {return}
        let entity = savedEntity[index]
        container.viewContext.delete(entity)
        saveBooking()
    }
    ///save the booking
    func saveBooking() {
        do {
            try  container.viewContext.save()
            fetchbooking()
        }catch{
            print(error.localizedDescription)
        }
    }
}
///userdefaults to string
extension UserDefaults {

    func setValue(value: String, key: String) {
        set(value, forKey: key)
        synchronize()
    }

    func getValue(key: String) -> String {
        synchronize()
        return string(forKey: key) ?? "Daniel"
       
    }
}

