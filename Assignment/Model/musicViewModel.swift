//
//  musicViewModel.swift
//  Assignment
//
//  Created by Rupinder Kaur on 18/07/22.
//  Copyright © 2022 Rupinder Kaur. All rights reserved.
//
import SwiftUI
import UIKit
import CoreData

public class musicViewModel {
   
    var trackDetails: [Track]? {
        didSet {
            guard let _ = trackDetails else { return }
            self.didFinishFetch?()
        }
    }
    
    let dispatchGroup = DispatchGroup()
    var didFinishFetch: (() -> ())?
    
    func fetchList() {
        let musicRequest = MusicRequest()
        
        // when reading from API
        musicRequest.fetchAPI(completion: { (result, error) in
            guard let result = result else {
                return
            }
            self.saveInCoreDataWith(array: result)
            self.trackDetails = result
        })
    }
    
    
    private func createMusicEntityFrom(array: Track) -> NSManagedObject? {
            let context = CoreDataStack.shared.persistentContainer.viewContext
            let entity =  NSEntityDescription.entity(forEntityName: "Entity", in: context)
            let musicEntity = NSManagedObject(entity: entity!, insertInto: context)
        
        musicEntity.setValue(array.title, forKey: "title")
        musicEntity.setValue(array.subtitle, forKey: "subTitle")
                return musicEntity
        }
    
    private func saveInCoreDataWith(array: [Track]) {
            _ = array.map{ self.createMusicEntityFrom(array: $0)}
            do {
                try CoreDataStack.shared.persistentContainer.viewContext.save()
            } catch let error {
                print(error)
            }
        }
}
