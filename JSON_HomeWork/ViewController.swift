//
//  ViewController.swift
//  JSON_HomeWork
//
//  Created by Aleksandr Zhazhoyan on 06.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    private let jokeLabel = UILabel()
    private let jokeButton = UIButton()
    private let jokeService = JokeService()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchJoke()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        jokeLabel.numberOfLines = 0
        jokeLabel.textAlignment = .center
        
        jokeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(jokeLabel)
        
        jokeButton.setTitle("Get Random Joke", for: .normal)
        jokeButton.setTitleColor(.systemBlue, for: .normal)
        jokeButton.addTarget(self, action: #selector(fetchJoke), for: .touchUpInside)
        
        jokeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(jokeButton)
        
        NSLayoutConstraint.activate([
            jokeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            jokeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            jokeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            jokeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            jokeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            jokeButton.topAnchor.constraint(equalTo: jokeLabel.bottomAnchor, constant: 20),
        ])
        
    }
    
    
    @objc private func fetchJoke() {
        
        jokeService.randomJoke { [weak self] result in
            switch result {
            case .success(let joke):
                DispatchQueue.main.async {
                    self?.jokeLabel.text = joke.fullJoke
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.jokeLabel.text = "Error: \(error)"
                }
            
            }
        }
    }


}


