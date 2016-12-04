
import Foundation


class NotificationStore {
  
  private static func printTotalExistingNotifications() {
    let store = UserDefaults.standard
    let count = store.array(forKey: "notifications")?.count
    debugPrint("Notificaciones encontradas localmente: \(count ?? 0)")
  }
  
  static func getAll() -> NSArray? { 
    return UserDefaults.standard.array(forKey: "notifications") as NSArray?
  }
  
  static func update(notifications: NSArray?) {
    guard notifications != nil else {
      print("No hay notificaciones a procesar")
      return
    }
    
    printTotalExistingNotifications()
    
    let store = UserDefaults.standard
    let existingNotifications = store.mutableArrayValue(forKey: "notifications")
    
    for notification in notifications! {
    
      if existingNotifications.contains(notification) {
        print("Notification \((notification as! NSDictionary)["id"]) already exists")
        break
      }
      existingNotifications.add(notification)
    }
    
    print(existingNotifications)
    store.setValue(existingNotifications.copy(), forKey: "notifications")
    
    print(store.synchronize())
    
    printTotalExistingNotifications()
  }
  
  static func notificationHasBeenRead(notificationId: String) -> Bool {
    let store = UserDefaults.standard
    let readNotifications = store.array(forKey: "readNotifications") as? [String]
    if readNotifications == nil || readNotifications!.count == 0 {
      return false
    }
    return readNotifications!.contains(notificationId)
  }
}
