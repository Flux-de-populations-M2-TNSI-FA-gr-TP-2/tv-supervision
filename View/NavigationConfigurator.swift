//
//  NavigationConfigurator.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 18/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import Foundation
import SwiftUI
struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}
