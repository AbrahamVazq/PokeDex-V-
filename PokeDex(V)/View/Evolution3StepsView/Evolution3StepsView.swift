//  Evolution3StepsView.swift
//  PokeDex(V)
//  Created by Abraham Vazquez on 08/05/23.

import UIKit

class Evolution3StepsView: UIView {
    //MARK: - O U T L E T S
    @IBOutlet weak var vwContainer:UIView!
    @IBOutlet weak var lblFirstLevel: UILabel!
    @IBOutlet weak var lblSecondLevel: UILabel!
    @IBOutlet weak var imgFirstStep: UIImageView!
    @IBOutlet weak var imgSecondStep: UIImageView!
    @IBOutlet weak var imgThirdStep: UIImageView!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblSecondName: UILabel!
    @IBOutlet weak var lblThirdName: UILabel!
    
    override func awakeFromNib() { }
    
    class func instantiate(with obj: NSObject) -> Evolution3StepsView {

        if let nib = Bundle.main.loadNibNamed(Evolution3StepsView.identifier,  owner: self, options: nil)?[0] as? Evolution3StepsView {
            nib.lblFirstLevel.text = "00"
            nib.lblSecondLevel.text = "00"
            nib.imgFirstStep.image = UIImage(named: "pokeballBlue")
            nib.imgSecondStep.image = UIImage(named: "pokeballBlue")
            nib.imgThirdStep.image = UIImage(named: "pokeballBlue")
            nib.lblFirstName.text = "pokemonUno"
            nib.lblSecondName.text = "Pokemon_Dos"
            nib.lblThirdName.text = "PKEMON::TRES"
            
            return nib
        }
        return Evolution3StepsView()
    }
    
}
