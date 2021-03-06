//
//  DisplayDashboardViewController.swift
//  Lemi-App
//
//  Created by Xander Mercado on 3/19/20.
//  Copyright (c) 2020 Xander Mercado. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DisplayDashboardDisplayLogic: class {
    func displaySomething(viewModel: DisplayDashboardModel.ViewModel)
}

class DisplayDashboardViewController: UIViewController, DisplayDashboardDisplayLogic, DisplayDashboardViewProtocol {
    var interactor: DisplayDashboardBusinessLogic?
    var router: (NSObjectProtocol & DisplayDashboardRoutingLogic)?
    
    lazy var myView: DisplayDashboardView = {
        let view = DisplayDashboardView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Setup
    
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(myView)
        view.addConstraint(NSLayoutConstraint(
            item: myView,
            attribute: .top,
            relatedBy: .equal,
            toItem: view,
            attribute: .top,
            multiplier: 1,
            constant: 0))
        if #available(iOS 11.0, *) {
            view.addConstraint(NSLayoutConstraint(
                item: myView,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: view.safeAreaLayoutGuide,
                attribute: .bottom,
                multiplier: 1,
                constant: 0))
        } else {
            view.addConstraint(NSLayoutConstraint(
                item: myView,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: view,
                attribute: .bottom,
                multiplier: 1,
                constant: 0))
        }
        view.addConstraint(NSLayoutConstraint(
            item: myView,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: view,
            attribute: .trailing,
            multiplier: 1,
            constant: 0))
        view.addConstraint(NSLayoutConstraint(
            item: myView,
            attribute: .width,
            relatedBy: .equal,
            toItem: view,
            attribute: .width,
            multiplier: 1,
            constant: 0))
    }
    
    private func configureView() {
        let viewController = self
        let interactor = DisplayDashboardInteractor()
        let presenter = DisplayDashboardPresenter()
        let router = DisplayDashboardRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupView()
        setupDefault()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setupDefault() {
        
    }
    
    // MARK: Event Handling
    
    func showSearchPage() {
        let controller = SearchCitiesViewController()
        controller.delegate = self
        self.router?.navigateToSomewhere(source: self, destination: controller, isPresented: false)
    }
    
    // MARK: Display Logic
    
    func displaySomething(viewModel: DisplayDashboardModel.ViewModel) {
        
    }
}

extension DisplayDashboardViewController: SearchCitiesViewControllerProtocol {
    func selectCity(city: City) {
        let name = city.name ?? ""
        myView.selectedCityLabel.text = "You selected: \(name)"
    }
}
