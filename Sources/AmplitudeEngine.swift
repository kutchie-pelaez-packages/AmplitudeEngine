import Amplitude
import AnalyticsEvent
import AnalyticsTracker
import CoreUtils

final class AmplitudeEngine: AnalyticsTracker {
    init(
        apiKey: String,
        environment: Environment
    ) {
        self.apiKey = apiKey
        self.environment = environment
    }

    private let apiKey: String
    private let environment: Environment

    private lazy var amplitude = Amplitude.instance()

    // MARK: - Startable

    func start() {
        guard environment.isProd else { return }

        amplitude.initializeApiKey(apiKey)
    }

    // MARK: - CustomStringConvertible

    var description: String {
        "Amplitude"
    }

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