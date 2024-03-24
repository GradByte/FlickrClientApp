//
//  PhotoDetailsViewController.swift
//  Flickr Client App
//
//  Created by GradByte on 24.03.2024.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
    
    var photo: Photo?
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.fetchImage(withURLString: photo?.buddyIconURL) { data in
            self.ownerImageView.image = UIImage(data: data)
        }
        NetworkManager.shared.fetchImage(withURLString: photo?.urlN) { data in
            self.imageView.image = UIImage(data: data)
        }
        ownerImageView.layer.cornerRadius = 24.0
        ownerNameLabel.text = photo?.ownername
        descriptionLabel.text = photo?.photoDescription?.content
        title = photo?.title
    }
    
}
