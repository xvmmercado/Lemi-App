//
//  SearchCitiesTableViewCell.swift
//  Lemi-App
//
//  Created by Xander Mercado on 3/19/20.
//  Copyright © 2020 Xander Mercado. All rights reserved.
//

import UIKit
import Kingfisher

class SearchCitiesTableViewCell: UITableViewCell {
    
    var cellDetails: City? {
        didSet {
            let name = cellDetails?.name ?? ""
            let subtitle = cellDetails?.subtitle ?? ""
            let color = cellDetails?.color?.hexColor ?? .white
            let banner = cellDetails?.banner ?? ""
            
            imageIcon.image = nil
            
            label.text = name
            subLabel.text = subtitle
            
            if banner != "" {
                if let urlImage = URL(string: banner) {
                    let resource = ImageResource(downloadURL: urlImage, cacheKey: "\(banner)")
//                    imageIcon.kf.setImage(with: resource, placeholder: nil, completionHandler: nil)
                    imageIcon.kf.setImage(with: resource, placeholder: nil) { (_, _, _, _) in
                        self.iconLabel.isHidden = true
                    }
                }
            } else {
                self.iconLabel.isHidden = false
                imageIcon.backgroundColor = color
                iconLabel.text = String(name.prefix(3))
            }
        }
    }
    
    let label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let iconLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func setupView() {
        
        let view = self.contentView
        
        view.addSubview(imageIcon)
        addConstraint(NSLayoutConstraint(
            item: imageIcon,
            attribute: .leading,
            relatedBy: .equal,
            toItem: view,
            attribute: .leading,
            multiplier: 1,
            constant: 16))
        addConstraint(NSLayoutConstraint(
            item: imageIcon,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerY,
            multiplier: 1,
            constant: 0))
        addConstraint(NSLayoutConstraint(
            item: imageIcon,
            attribute: .width,
            relatedBy: .equal,
            toItem: .none,
            attribute: .width,
            multiplier: 1,
            constant: 50))
        addConstraint(NSLayoutConstraint(
            item: imageIcon,
            attribute: .height,
            relatedBy: .equal,
            toItem: .none,
            attribute: .height,
            multiplier: 1,
            constant: 50))
        
        view.addSubview(iconLabel)
        addConstraint(NSLayoutConstraint(
            item: iconLabel,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: imageIcon,
            attribute: .centerX,
            multiplier: 1,
            constant: 0))
        addConstraint(NSLayoutConstraint(
            item: iconLabel,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: imageIcon,
            attribute: .centerY,
            multiplier: 1,
            constant: 0))
        
        view.addSubview(label)
        addConstraint(NSLayoutConstraint(
            item: label,
            attribute: .leading,
            relatedBy: .equal,
            toItem: imageIcon,
            attribute: .trailing,
            multiplier: 1,
            constant: 6))
        addConstraint(NSLayoutConstraint(
            item: label,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: imageIcon,
            attribute: .centerY,
            multiplier: 1,
            constant: 0))
        
        view.addSubview(subLabel)
        addConstraint(NSLayoutConstraint(
            item: subLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: imageIcon,
            attribute: .trailing,
            multiplier: 1,
            constant: 6))
        addConstraint(NSLayoutConstraint(
            item: subLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: imageIcon,
            attribute: .centerY,
            multiplier: 1,
            constant: 2))
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
