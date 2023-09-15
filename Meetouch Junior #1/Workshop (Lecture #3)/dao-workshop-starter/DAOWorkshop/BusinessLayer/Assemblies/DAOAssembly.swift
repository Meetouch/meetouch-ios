//
//  DAOAssembly.swift
//  DAOWorkshop
//
//  Generated automatically by dao-autograph
//  https://github.com/Incetro/dao-autograph
//
//  Copyright © 2020 Incetro Inc. All rights reserved.
//
// swiftlint:disable trailing_newline

import SDAO
import Monreau
import Swinject
import RealmSwift

// MARK: - DAOAssembly

final class DAOAssembly: CollectableAssembly {

    required init() {
    }

    func assemble(inContainer container: Container) {

        container.register(ProjectDAO.self) { resolver in
            let translator = resolver.resolve(ProjectTranslator.self).unsafelyUnwrapped
            let configuration = resolver.resolve(RealmConfiguration.self).unsafelyUnwrapped
            return ProjectDAO(
                storage: RealmStorage<ProjectModelObject>(configuration: configuration),
                translator: translator
            )
        }

        container.register(UserDAO.self) { resolver in
            let translator = resolver.resolve(UserTranslator.self).unsafelyUnwrapped
            let configuration = resolver.resolve(RealmConfiguration.self).unsafelyUnwrapped
            return UserDAO(
                storage: RealmStorage<UserModelObject>(configuration: configuration),
                translator: translator
            )
        }
    }
}