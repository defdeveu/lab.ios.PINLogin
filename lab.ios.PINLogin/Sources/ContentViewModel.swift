import Combine

final class ContentViewModel: ObservableObject {
    private static let passwordKey = "password"
    @Published var showAlert: Bool = false
    private(set) var alertMessage: String = ""

    private let settingsRepository: SettingsRepositoryProtocol

    init(settingsRepository: SettingsRepositoryProtocol = AppRepository.shared.settingsRepository) {
        self.settingsRepository = settingsRepository
    }

    func login(with password: String) {
        guard let originalPassword = settingsRepository.get(key: Self.passwordKey) else {
            alertMessage = "Storage is damaged."
            showAlert = true
            return
        }

        if password == originalPassword {
            alertMessage = "Great job, welcome!"
        } else {
            alertMessage = "Sorry, we cannot let you in."
        }

        showAlert = true
    }
}
