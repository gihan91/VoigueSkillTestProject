//
//  MainInfoTableViewCell.swift
//  VoigueTestApp
//
//  Created by mac on 9/1/22.
//

import UIKit

class MainInfoTableViewCell: UITableViewCell {

   
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(model: MovieInfo) {
        DispatchQueue.main.async {
            self.lblTitle.text = model.title
        }
       
    }
    
}
