//
//  SpinnerViewController.swift
//  MoviesApp
//
//  Created by Rabeb Chelbi on 3/7/2022.
//

import UIKit

class SpinnerViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style:.large)

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
