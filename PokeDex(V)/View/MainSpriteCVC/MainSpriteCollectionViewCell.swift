//  MainSpriteCollectionViewCell.swift
//  PokeDex(V)
//  Created by Abraham Vazquez on 06/05/23.

import UIKit

class MainSpriteCollectionViewCell: UICollectionViewCell {
    //MARK: - O U T L E T S
    @IBOutlet weak var vwContainer: UIView!{ didSet{ vwContainer.cornerRadius = 15 } }
    @IBOutlet weak var imgSprite: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setSprite(withImage img: String){
//        self.imgSprite.image = UIImage(w)
    }

}
