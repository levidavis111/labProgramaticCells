//
//  UserDetailViewController.swift
//  ProgrammaticUserCells
//
//  Created by Levi Davis on 10/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    
    var oneUser: User!

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubviews()
        constrainSubviews()
        setImage()
        // Do any additional setup after loading the view.
    }
    
    private func addSubviews() {
        self.view.addSubview(imageView)
    }
    
    private func constrainSubviews() {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private func setImage() {
        let urlString = oneUser.picture.medium
        ImageManager.manager.getImage(urlStr: urlString) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let image):
                DispatchQueue.main.async {
                    self.imageView.image = image

                }
            }
        }
    }

}
