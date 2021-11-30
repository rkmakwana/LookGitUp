//
//  RepoDetailsWorkerImplementation.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/29/21.
//

import Foundation
import CoreData
import UIKit

class RepoDetailsWorkerImplementation: RepoDetailsWorker {
    func getLikeStatus(repoId: Int) throws -> (liked: Bool, disliked: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return (false, false)
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LikeStatus")
        fetchRequest.predicate = NSPredicate(format: "id = %d", repoId)
        if let status = try managedContext.fetch(fetchRequest).first as? LikeStatus {
            return (status.liked, status.disliked)
        }
        return (false, false)
    }

    func setLikeStatus(repoId: Int, liked: Bool, disliked: Bool) throws {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LikeStatus")
        fetchRequest.predicate = NSPredicate(format: "id = %d", repoId)

        if let status = try managedContext.fetch(fetchRequest).first as? LikeStatus {
            status.liked = liked
            status.disliked = disliked
        } else {
            let entity = NSEntityDescription.entity(forEntityName: "LikeStatus", in: managedContext)!
            guard let status = NSManagedObject(entity: entity,
                                               insertInto: managedContext) as? LikeStatus else {
                return
            }
            status.id = Int32(repoId)
            status.liked = liked
            status.disliked = disliked
        }
        try managedContext.save()
    }
}
