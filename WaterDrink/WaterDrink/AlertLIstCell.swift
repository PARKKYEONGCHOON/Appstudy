//
//  AlertLIstCell.swift
//  WaterDrink
//
//  Created by 박경춘 on 2023/03/20.
//

import UIKit

class AlertLIstCell: UITableViewCell {

    @IBOutlet var meridiemLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var alertSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func alertSwitchChange(_ sender: UISwitch) {
        guard let data = UserDefaults.standard.value(forKey: "alerts") as? Data,
              var alerts = try? PropertyListDecoder().decode([Alert].self, from: data) else { return }
        
        alerts[sender.tag].isOn = sender.isOn
        UserDefaults.standard.set(try? PropertyListEncoder().encode(alerts), forKey: "alerts")
              
    }
    
}
