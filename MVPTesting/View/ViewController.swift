//
//  ViewController.swift
//  MVPTesting
//
//  Created by Aleksandr Rybachev on 02.11.2021.
//

import UIKit

protocol GreetingViewProtocol: AnyObject {
    func setGreeting(_ greeting: String)
}

class ViewController: UIViewController {
    
    // MARK: - Properies
    
    var presenter: GreetingPresenterProtocol!
    var person: Person!
    
    // MARK: - Views
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Please tap to Screen"
        label.numberOfLines = 0
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        button.tintColor = .white
        button.setTitle("Press me", for: .normal)
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
       
        person = Person(name: "Tim", surname: "Cook")
        presenter = GreetingPresenter(view: self, person: person)
    }

    // MARK: - Setup
    private func setupHierarchy() {
        view.backgroundColor = .white
        view.addSubview(textLabel)
        view.addSubview(button)
    }
    
    private func setupLayout() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        button.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 160).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    // MARK: - Button Action
    
    @objc func didTapButton(_ button: UIButton) {
        presenter.showGreeting()
    }
}

extension ViewController: GreetingViewProtocol {
    func setGreeting(_ greeting: String) {
        textLabel.text = greeting
    }
}

