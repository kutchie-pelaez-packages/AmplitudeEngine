import Amplitude
import Analytics
import Core

final class AmplitudeEngine: AnalyticsTracker {
    private let apiKey: String
    private let environment: Environment

    private lazy var amplitude = Amplitude.instance()

    init(
        apiKey: String,
        environment: Environment
    ) {
        self.apiKey = apiKey
        self.environment = environment
        initializeSDK()
    }

    private func initializeSDK() {
        guard environment.isProd else { return }

        amplitude.initializeApiKey(apiKey)
    }

    // MARK: - CustomStringConvertible

    var description: String { "Amplitude" }

    // MARK: - AnalyticsEngine

    func track(_ event: AnalyticsEvent) {
        guard environment.isProd else { return }

        amplitude.logEvent(
            event.name,
            withEventProperties: event.parameters
        )
    }

    func track(_ userProperties: AnalyticsUserProperties) {
        guard environment.isProd else { return }

        amplitude.setUserProperties(userProperties)
    }
}
