//  Evolution2StepsView.swift
//  PokeDex(V)
//  Created by Abraham Vazquez on 08/05/23.

import UIKit

class Evolution2StepsView: UIView {
     //MARK: - O U T L E T S
     
     @IBOutlet weak var vwContainer:UIView!
     @IBOutlet weak var lblLevel: UILabel!
     @IBOutlet weak var imgFirstStep: UIImageView!
     @IBOutlet weak var imgSecondStep: UIImageView!
     @IBOutlet weak var lblFirstName: UILabel!
     @IBOutlet weak var lblSecondName: UILabel!
     
    override func awakeFromNib() { }
    
    class func instantiate(with obj: NSObject) -> Evolution2StepsView {

        if let nib = Bundle.main.loadNibNamed(Evolution2StepsView.identifier,  owner: self, options: nil)?[0] as? Evolution2StepsView {
//            nib.frame.size.height = CGFloat(height )
            nib.lblLevel.text = "00"
            nib.imgFirstStep.image = UIImage(named: "")
            nib.imgSecondStep.image = UIImage(named: "")
            nib.lblFirstName.text = "pokemonUno"
            nib.lblSecondName.text = "Pokemon_Dos"
            
            return nib
        }
        return Evolution2StepsView()
    }
}
