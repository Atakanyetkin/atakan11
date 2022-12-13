//
//  CoreDataManager.swift
//  Font Changer
//
//  Created by Y. Yılmaz Erdoğmuş on 05.12.2022.
//

import CoreData
import UIKit

final class CoreDataManager {
    static let shared = CoreDataManager()

    // MARK: - Properties
    private var modelName = "CoreDataModel"

    // MARK: - Initialization
    init(modelName: String! = "CoreDataModel") {
        self.modelName = modelName
    }

    // MARK: - Core Data Stack
    private(set) lazy var managedObjectContext: NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator
        return managedObjectContext
    }()

    private lazy var managedObjectModel: NSManagedObjectModel = {
        guard let modelURL = Bundle.main.url(forResource: self.modelName, withExtension: "momd") else {
            fatalError("Unable to Find Data Model")
        }
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Unable to Load Data Model")
        }
        return managedObjectModel
    }()

    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let fileManager = FileManager.default
        let storeName = "\(self.modelName).sqlite"
        let documentsDirectoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let persistentStoreURL = documentsDirectoryURL.appendingPathComponent(storeName)

        do {
            try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                                              configurationName: nil,
                                                              at: persistentStoreURL,
                                                              options: nil)
        } catch {
            fatalError("Unable to Load Persistent Store")
        }
        return persistentStoreCoordinator
    }()

    // MARK: - Core Data Saving Functions

    func saveDataToCoreData(data: Data, type: String, date: Date) {
        // MARK: - CoreDataModel içinde Entitynizin adını değiştirirseniz alttaki değişkenden de değiştirin.

        let entity = NSEntityDescription.insertNewObject(forEntityName: "Data", into: self.managedObjectContext)
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Data")
            try self.managedObjectContext.save()
        } catch {}
    }

    func updateCoreData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Data")
        fetchRequest.predicate = NSPredicate(format: "\("Buraya filtre gir. obje.id gibi.") = %@", "searchValue")

        do {
            let results = try self.managedObjectContext.fetch(fetchRequest) as? [NSManagedObject]

        } catch {
            print("Fetch Failed: \(error)")
        }
        do {
            try self.managedObjectContext.save()
        } catch {
            print("Can not save data")
        }
    }

    func fetchDataFromCoreData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Data")
        fetchRequest.returnsObjectsAsFaults = false

        do {
            let datas = try self.managedObjectContext.fetch(fetchRequest)
        } catch {}
    }

    func deleteDataFromCoreData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data")
        request.predicate = NSPredicate(format: "id = %@", "\("Buraya filtre yöntemini girin. data.id gibi.")")

        let result = try? self.managedObjectContext.fetch(request)
        guard result is [NSManagedObject] else { return }
        do {
            try self.managedObjectContext.save()
        } catch {}
    }
}
