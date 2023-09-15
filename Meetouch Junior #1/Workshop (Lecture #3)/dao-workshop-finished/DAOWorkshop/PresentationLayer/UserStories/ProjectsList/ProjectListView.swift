//
//  ProjectListView.swift
//  DAOWorkshop
//
//  Created by Meetouch on 12/1/22.
//

import SDAO
import SwiftUI

// MARK: - ProjectListView

struct ProjectListView: View {

    // MARK: - Properties

    @ObservedObject var viewModel: ViewModel

    // MARK: - View

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.projects) { item in
                    ProjectItemView(item: item)
                }
                .onDelete { indexSet in
                    viewModel.remove(indexSet: indexSet)
                }
            }
            .onAppear {
                viewModel.reloadProjects()
            }
            .animation(.default, value: viewModel.projects)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.addRandomProject()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationTitle("Projects")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

// MARK: - ViewModel

extension ProjectListView {

    final class ViewModel: ObservableObject {

        // MARK: - Properties

        @Published private(set) var projects: [ProjectItemState] = []
        
        /// ProjectDAO instance
        private let dao: ProjectDAO
        
        /// Default initializer
        /// - Parameter dao: ProjectDAO instance
        init(dao: ProjectDAO) {
            self.dao = dao
        }

        // MARK: - Useful
        
        func addRandomProject() {
            let plain = ProjectPlainObject.random()
            projects.insert(ProjectItemState(from: plain), at: 0)
            try? dao.persist(plain)
        }
        
        func remove(indexSet: IndexSet) {
            for index in indexSet {
                let plain = projects.remove(at: index)
                try? dao.erase(byPrimaryKey: plain.id)
            }
        }

        func reloadProjects() {
            do {
                projects = try dao.read().map(ProjectItemState.init)
            } catch {
                print(error)
            }
        }
    }
}

