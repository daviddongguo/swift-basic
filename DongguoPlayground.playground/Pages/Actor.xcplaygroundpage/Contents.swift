//: [Previous](@previous)

actor TemperatureLogger {
    let label: String
    private var measurements: [Int]
    private(set) var max: Int

    init(label: String, measurement: Int) {
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }
}

extension TemperatureLogger {
    func update(with measurement: Int) {
        measurements.append(measurement)
        if measurement > max {
            max = measurement
        }
    }
}

let logger = TemperatureLogger(label: "Outdoors", measurement: 25)
Task {
    print(await logger.max)
    await logger.update(with: 35)
    print(await logger.max)
}

//: [Next](@next)
