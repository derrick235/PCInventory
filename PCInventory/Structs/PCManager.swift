//
//  PCManager.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class PCManager: ObservableObject {
    
    @Published private(set) var pcs: [PC] = [] // where all PCs will be stored
    let db = Firestore.firestore()
    
    init() {
        
        getPCs()
        
    }
    
    func getPCs() {
        
        db.collection("pcs").addSnapshotListener { querySnapshot, error in
            
            // get snapshot of data
            guard let documents = querySnapshot?.documents
            else {
                print("Error fetching documents: \(error)")
                return
            }
            
            // convert data into PC struct
            self.pcs = documents.compactMap { document -> PC? in
                
                do {
                    
                    return try document.data(as: PC.self)
                    
                } catch {
                    
                    print("Error decoding document into a PC: \(error)")
                    return nil
                    
                }
                
            }
            
            // sort in ABC order
            self.pcs.sort {
                
                $0.firstName < $1.firstName
                
            }
            
        }
        
    }
    
    // get PCs of the specified user
    func getUsersPCs(firstName: String, lastName: String) -> [PC] {
        
        let pcList = self.pcs
        var result: [PC] = []
        
        for pc in pcList {
            
            if (pc.firstName == firstName && pc.lastName == lastName) {
                
                result.append(pc)
                
            }
            
        }
        
        return result
        
    }

    // get all first and last names of users
    func getUsers() -> ([String], [String]) {
        
        let pcList = self.pcs
        var firstNameList: [String] = []
        var lastNameList: [String] = []
        
        for pc in pcList {
            
            if !(firstNameList.contains(pc.firstName) && lastNameList.contains(pc.lastName)) {
                
                firstNameList.append(pc.firstName)
                lastNameList.append(pc.lastName)
                
            }
            
        }
        
        return (firstNameList, lastNameList)
        
    }
    
    func getMigratedUsers() -> Int {
        
        var migratedUsers: [String] = []
        let pcList = self.pcs
        var count = 0
        
        for pc in pcList {
            
            if !(migratedUsers.contains(pc.firstName + " " + pc.lastName)) {
                print("DOES NOT CONTAIN!")
                
                if (pc.status == "Discontinued") {
                    print("DISCONTINUED!")
                    count += 1
                    migratedUsers.append(pc.firstName + " " + pc.lastName)

                }
                
            }
            
        }
        
        print(count)
        
        return count
        
    }
    
    func sendPC(firstName: String, lastName: String, pcSN: String, pcLocation: String, pcType: String, isReplaced: Bool, replacedBy: String, status: String) {
        
        do {
            
            // make a new document
            let ref = db.collection("pcs").document()
            
            // make a new PC
            let newPC = PC(id: ref.documentID, firstName: firstName, lastName: lastName, isReplaced: isReplaced, pcLocation: pcLocation, pcSN: pcSN, pcType: pcType, replacedBy: replacedBy, status: status)
            
            // attempt to set the data with newPC
            try ref.setData(from: newPC)
            
        } catch {
            
            print("Error: \(error)")
            
        }
        
    }
    
    func deletePC(docID: String) {
        
        db.collection("pcs").document(docID).delete() { error in
            
            if let error = error {
                
                print("Error removing document: \(error)")
                
            }
            
        }
        
    }
    
}

