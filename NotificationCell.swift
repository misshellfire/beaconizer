
import UIKit

class NotificationCell: UITableViewCell {
  
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var notificationId: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
}
