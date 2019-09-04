import Foundation

class Observable: NSObject {
    @objc dynamic public var value: Int = 0
}


func some() {
    let observable: Observable = .init()
    let keyPath: KeyPath<Observable, Int> = \.value
    let options: [NSKeyValueObservingOptions] = [[.new, .initial]]

    options.forEach { option in
        print("### \(option) ###")
        print("### Before value changes. ###")
        var observation: NSKeyValueObservation = observable.observe(keyPath, options: option) { (_, change: NSKeyValueObservedChange<Int>) in
            print("indexes = \(String(describing: change.indexes))")
            print("isPrior = \(change.isPrior)")
            print("kind = \(change.kind)")
            print("newValue = \(String(describing: change.newValue))")
            print("oldValue = \(String(describing: change.oldValue))")
        }
        print("")

        print("### After value changed. ###")
        observable.value = 1
        print("")
    }
}

some()


