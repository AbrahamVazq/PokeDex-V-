//  SimpleTableViewCell.swift
//  PokeDex(V)
//  Created by Moises Abraham Vazquez Perez on 13/02/23.

import UIKit

class SimpleTableViewCell: UITableViewCell {
    //MARK: - O U T L E T S
    @IBOutlet weak var lblTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
