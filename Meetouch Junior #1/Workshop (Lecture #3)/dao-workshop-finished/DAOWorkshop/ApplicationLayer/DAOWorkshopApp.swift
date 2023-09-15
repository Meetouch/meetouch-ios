//
//  DAOWorkshopApp.swift
//  DAOWorkshop
//
//  Created by Meetouch on 11/30/22.
//

import SwiftUI

@main
struct DAOWorkshopApp: App {

    // MARK: - App

    var body: some Scene {
        WindowGroup {
            ProjectListView(viewModel: .init(dao: DAOProvider.shared.projectsDAO))
        }
    }
}
