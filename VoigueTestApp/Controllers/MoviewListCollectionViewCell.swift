//
//  MoviewListCollectionViewCell.swift
//  VoigueTestApp
//
//  Created by mac on 8/1/22.
//

import UIKit
import Kingfisher

class MoviewListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgMoviePoster: UIImageView!
    @IBOutlet weak var lblMovieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //Download the image from URL using kingfisher
    func downloadImage(`with` urlString : String){
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url)

        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let value):
                DispatchQueue.main.async {
                    self.imgMoviePoster.image = value.image
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }

}
