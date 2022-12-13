//
//  ConstantHandler.swift
//  Font Changer
//
//  Created by Y. Yılmaz Erdoğmuş on 07.12.2022.
//

import Foundation

final class Constant {
    static let shared = Constant()
    var rcAPIKey = String()
    var termOfUseLink = URL(string: "")
    var privacyPolicyLink = URL(string: "")
    var weeklyProductID = String()
    var monthlyProductID = String()
    var annualProductID = String()
    var restoreToken = String()
    var adjustAppToken = String()
    var purchaseToken = String()
    var openPaywallToken = String()
    var monthlyClickToken = String()
    var monthlyFailedToken = String()
    var monthlySuccessToken = String()
    var weeklyClickToken = String()
    var weeklyFailedToken = String()
    var weeklySuccessToken = String()
    var yearlyClickToken = String()
    var yearlyFailedToken = String()
    var yearlySuccessToken = String()
    var appPushToken = String()

    func getValuesFromPlist() {
        if let path = Bundle.main.path(forResource: "Constants", ofType: "plist"),
           let xml = FileManager.default.contents(atPath: path)
        {
            // swiftlint:disable line_length
            guard let plist = (try? PropertyListSerialization.propertyList(from: xml,
                                                                           options: .mutableContainersAndLeaves,
                                                                           format: nil)) as? [String: String] else { return }

            guard let sharedRCAPIKey = plist["RevenueCat API Key"] else {
                fatalError("Adjust token not exist in Constants.plist")
            }
            self.rcAPIKey = sharedRCAPIKey

            guard let termOfUseLinkTemp = plist["Term of Use Link"] else {
                fatalError("Adjust token not exist in Constants.plist")
            }
            self.termOfUseLink = URL(string: termOfUseLinkTemp)

            guard let privacyPolicyLinkTemp = plist["Privacy Policy Link"] else {
                fatalError("Adjust token not exist in Constants.plist")
            }
            self.privacyPolicyLink = URL(string: privacyPolicyLinkTemp)

            guard let weeklyProductIDTemp = plist["Weekly Product ID"] else {
                fatalError("Adjust token not exist in Constants.plist")
            }
            self.weeklyProductID = weeklyProductIDTemp

            guard let monthlyProductIDTemp = plist["Monthly Product ID"] else {
                fatalError("Adjust token not exist in Constants.plist")
            }
            self.monthlyProductID = monthlyProductIDTemp

            guard let annualProductIDTemp = plist["Annual Product ID"] else {
                fatalError("Adjust token not exist in Constants.plist")
            }
            self.annualProductID = annualProductIDTemp

            guard let appTokenTemp = plist["Adjust App Token"] else {
                fatalError("Adjust token not exist in Constants.plist")
            }
            self.adjustAppToken = appTokenTemp
            
            guard let restoreTokenTemp = plist["app_restored_store_purchase"] else {
                fatalError("Adjust token not exist in Constants.plist")
            }
            self.restoreToken = restoreTokenTemp
            
            guard let purchaseTokenTemp = plist["in_app_purchase"] else {
                fatalError("Adjust token not exist in Constants.plist")
            }
            self.purchaseToken = purchaseTokenTemp
            
            guard let openPaywallTemp = plist["app_open_billing_page"] else {
                fatalError("Adjust token not exist in Constants.plist")
            }
            self.openPaywallToken = openPaywallTemp
            
            guard let monthlyClickedTemp = plist["app_monthly_subscription_click"] else {
                fatalError("Adjust token not exist in Constants.plist")
            }
            self.monthlyClickToken = monthlyClickedTemp
            
            guard let monthlyFailedTemp = plist["app_monthly_subscription_failed"] else {
                fatalError("Adjust token not exist in Constants.plist")
            }
            self.monthlyFailedToken = monthlyFailedTemp
            
            guard let monthlySuccessTemp = plist["app_monthly_subscription_success"] else {
                fatalError("Adjust token not exist in Constants.plist")
            }
            self.monthlySuccessToken = monthlySuccessTemp
            
            guard let weeklyClickedTemp = plist["app_weekly_subscription_click"] else {
                fatalError("Adjust token not exist in Constants.plist")
            }
            self.weeklyClickToken = weeklyClickedTemp
            
            guard let weeklyFailedTemp = plist["app_weekly_subscription_failed"] else {
                fatalError("Adjust token not exist in Constants.plist")
            }
            self.weeklyFailedToken = weeklyFailedTemp
            
            guard let weeklySuccessTemp = plist["app_weekly_subscription_success"] else {
                fatalError("Adjust token not exist in Constants.plist")
            }
            self.weeklySuccessToken = weeklySuccessTemp
            
            guard let yearlyClickedTemp = plist["app_yearly_subscription_click"] else {
                fatalError("Adjust token not exist in Constants.plist")
            }
            self.yearlyClickToken = yearlyClickedTemp
            
            guard let yearlyFailedTemp = plist["app_yearly_subscription_failed"] else {
                fatalError("Adjust token not exist in Constants.plist")
            }
            self.yearlyFailedToken = yearlyFailedTemp
            
            guard let yearlySuccessTemp = plist["app_yearly_subscription_success"] else {
                fatalError("Adjust token not exist in Constants.plist")
            }
            self.yearlySuccessToken = yearlySuccessTemp
            
            guard let appPushTemp = plist["app_push_token"] else {
                fatalError("Adjust token not exist in Constants.plist")
            }
            self.appPushToken = appPushTemp
        }
    }
}
