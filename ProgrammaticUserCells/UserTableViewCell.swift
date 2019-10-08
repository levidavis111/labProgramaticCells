//
//  UserTableViewCell.swift
//  ProgrammaticUserCells
//
//  Created by Levi Davis on 10/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.numberOfLines = 0
        
        return nameLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(nameLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setConstraints() {
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = true
        self.nameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.nameLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.nameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

}
