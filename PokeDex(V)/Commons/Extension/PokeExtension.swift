//  PokeExtension.swift
//  PokeDex(V)
//  Created by Moises Abraham Vazquez Perez on 13/02/23.


import UIKit

//MARK: - UI · T A B L E · V I E W · C E L L
public extension UITableViewCell {
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: .main) }
}


extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {  return layer.cornerRadius}
        
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
}

extension UIImageView {
    
    func loadImage(strURL: String?) -> URLSessionDownloadTask? {
        guard let url = URL(string: strURL ?? "") else { return nil }
        let session = URLSession.shared
        let downloadTask = session.downloadTask(with: url) { [weak self] url, response, error in
            guard let self = self else { return }
            if error == nil, let url = url, let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
        downloadTask.resume()
        return downloadTask
    }
    
}
