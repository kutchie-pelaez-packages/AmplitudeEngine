import Analytics
import Core

public struct AmplitudeEngineFactory {
    public init() { }

    public func produce(
        apiKey: String,
        environment: Environment
    ) -> AnalyticsTracker {
        AmplitudeEngine(
            apiKey: apiKey,
            environment: environment
        )
    }
}
