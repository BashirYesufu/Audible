//
//  PageCell.swift
//  audible
//
//  Created by mac on 8/21/21.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let page = page else { return }
            
            var imageName = page.imageName
            if UIDevice.current.orientation.isLandscape {
                imageName += "_landscape"
            }
            
            imageView.image = UIImage(named: imageName)
            
            let color = UIColor(white: 0.2, alpha: 1)
            
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor: color])
            
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: color]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            
            let length = attributedText.string.count
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            textview.attributedText = attributedText
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .yellow
        iv.image = UIImage(named: "page1")
        iv.clipsToBounds = true
        return iv
    }()
    
    let textview: UITextView = {
        let tv = UITextView()
        tv.text = "SAMPLE TEXT"
        tv.isEditable = false
        tv.backgroundColor = .white
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    let lineSeperator: UIView = {
        let ls = UIView()
        ls.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return ls
    }()
    
    func setupViews() {
        addSubview(imageView)
        addSubview(textview)
        addSubview(lineSeperator)
        
        imageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: textview.topAnchor, right: rightAnchor)
        //textview.anchorToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        textview.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        textview.anchorWithConstantsToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        lineSeperator.anchorToTop(top: nil, left: leftAnchor, bottom: textview.topAnchor, right: rightAnchor)
        lineSeperator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
