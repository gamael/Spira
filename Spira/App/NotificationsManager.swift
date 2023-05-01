//
//  NotificationsManager.swift
//  Spira
//
//  Created by Alejandro Agudelo on 1/05/23.
//

import Foundation
import NotificationCenter

class NotificationManager: NSObject {
    
    static let shared = NotificationManager()
    var productos = [Producto]()
    
    private override init() {
        super.init()
    }

    func requestNotificationsPermissions() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
        }
    }
    
    private func navigateToProduct(id: Int) {
        guard let product = findProductoWith(id: id) else {
            return
        }
        let vc = DetalleConfigurator.shared.getScene(with: product)
        guard let rootVC = UIApplication.shared.windows.first?.rootViewController else {
            return
        }
        rootVC.present(vc, animated: true)
    }
    
    private func findProductoWith(id: Int) -> Producto? {
        for producto in productos {
            if producto.id == id {
                return producto
            }
        }
        return nil
    }
}



extension NotificationManager: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response:UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        guard let idProducto = userInfo["ID"] as? String else {
            return
        }
        let idProductoInt = Int(idProducto) ?? 0
        navigateToProduct(id: idProductoInt)
    }
}
