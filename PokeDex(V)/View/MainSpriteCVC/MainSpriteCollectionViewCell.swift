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
    private var url: String = ""
    let bckImage: UIImage = UIImage(named: "pokeballBlue") ?? UIImage()


    override func awakeFromNib() {
        super.awakeFromNib()
        imgSprite.backgroundColor = UIColor(patternImage: bckImage)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        downloadTask?.cancel()
        downloadTask = nil
        url = ""
    }
    
    public func setSprite(withImage img: String){
        self.url = img
        self.downloadTask = imgSprite.loadImage(strURL: url)
    }

}
