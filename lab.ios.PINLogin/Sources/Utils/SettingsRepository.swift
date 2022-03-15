import Foundation

protocol SettingsRepositoryProtocol {
    func get(key: String) -> String?
}

final class SettingsRepository: SettingsRepositoryProtocol {
    func get(key: String) -> String? {
        settings[key]
    }

    private var settings: [String: String] {
        guard let fileURL = Bundle.main.url(forResource: "settings", withExtension: "plist")
        else { return [:] }

        return (NSDictionary(contentsOf: fileURL) as? [String : String]) ?? [:]
    }
}
