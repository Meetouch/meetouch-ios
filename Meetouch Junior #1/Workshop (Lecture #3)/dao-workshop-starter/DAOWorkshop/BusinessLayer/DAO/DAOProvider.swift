//
//  DAOProvider.swift
//  DAOWorkshop
//
//  Created by incetro on 8/10/23.
//

import SDAO
import Monreau
import RealmSwift

// MARK: - DAOProvider

final class DAOProvider {
    
    // MARK: - Properties
    
    /// The shared instance of the `DAOProvider`
    static let shared = DAOProvider()
    
    /// The configuration for the underlying Realm database
    private let configuration = RealmConfiguration(
        databaseFileName: "DAOWorkshop.realm",
        databaseVersion: 2
    )
    
    /// The Data Access Object (DAO) instance for managing user data
    private(set) lazy var userDAO = DAO(
        storage: RealmStorage<UserModelObject>(configuration: configuration),
        translator: UserTranslator(configuration: configuration)
    )
    
    /// The Data Access Object (DAO) instance for managing projects data
    private(set) lazy var projectsDAO = DAO(
        storage: RealmStorage<ProjectModelObject>(configuration: configuration),
        translator: ProjectTranslator(configuration: configuration)
    )
}
