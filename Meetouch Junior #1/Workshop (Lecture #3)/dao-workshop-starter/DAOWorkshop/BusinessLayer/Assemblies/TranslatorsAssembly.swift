//
//  TranslatorsAssembly.swift
//  DAOWorkshop
//
//  Generated automatically by dao-autograph
//  https://github.com/Incetro/dao-autograph
//
//  Copyright © 2020 Incetro Inc. All rights reserved.
//
// swiftlint:disable trailing_newline

import Monreau
import Swinject
import RealmSwift

// MARK: - TranslatorsAssembly

final class TranslatorsAssembly: CollectableAssembly {

    required init() {
    }

    func assemble(inContainer container: Container) {

        container.register(ProjectTranslator.self) { resolver in
            let configuration = resolver.resolve(RealmConfiguration.self).unsafelyUnwrapped
            return ProjectTranslator(configuration: configuration)
        }

        container.register(UserTranslator.self) { resolver in
            let configuration = resolver.resolve(RealmConfiguration.self).unsafelyUnwrapped
            return UserTranslator(configuration: configuration)
        }
    }
}