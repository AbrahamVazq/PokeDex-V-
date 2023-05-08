//  MainSpriteCollectionViewCell.swift
//  PokeDex(V)
//  Created by Abraham Vazquez on 06/05/23.

import UIKit

class MainSpriteCollectionViewCell: UICollectionViewCell {
    //MARK: - O U T L E T S
    @IBOutlet weak var vwContainer: UIView!{ didSet{ vwContainer.cornerRadius = 15 } }
    @IBOutlet weak var imgSprite: UIImageView!
    
    
    //MARK: - V A R I A B L E S
    private var downloadTask: URLSessionDownloadTask?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        downloadTask?.cancel()
        downloadTask = nil
    }
    
    public func setSprite(withImage img: String){
        self.downloadTask = imgSprite.loadImage(strURL: img)
    }

}
