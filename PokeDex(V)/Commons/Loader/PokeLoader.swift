//  PokeLoader.swift
//  PokeDex(V)
//  Created by Abraham Vazquez on 31/05/23.

import UIKit

class PokeLoader {
    static let shared = PokeLoader()
    private var backgroundView: UIView?
    private var activityIndicator: UIActivityIndicatorView?
    
    private init() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator?.color = .white
        activityIndicator?.backgroundColor = .clear
        activityIndicator?.layer.cornerRadius = 10
        activityIndicator?.hidesWhenStopped = true
    }

    // PokeLoader.shared.show(in: self.view)
    func show(in view: UIView) {
        DispatchQueue.main.async {
            if let indicator = self.activityIndicator {
                self.backgroundView = UIView(frame: view.bounds)
                self.backgroundView?.backgroundColor = UIColor.black.withAlphaComponent(0.5)
                self.backgroundView?.addSubview(indicator)
                indicator.center = view.center
                view.addSubview(self.backgroundView!)
                indicator.startAnimating()
                
                UIView.animate(withDuration: 0.3) {
                    self.backgroundView?.alpha = 1
                }
                
            }
        }
    }
    
    // PokeLoader.shared.hide()
    func hide() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, animations: {
                self.backgroundView?.alpha = 0
            }) { _ in
                self.activityIndicator?.stopAnimating()
                self.backgroundView?.removeFromSuperview()
                self.backgroundView = nil
            }
        }
    }
    
}
