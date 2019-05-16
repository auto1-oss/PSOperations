import XCTest
@testable import PSOperations

private enum TestOperationError: Error {
    case firstError
}

private class ErrorOperation: PSOperation {
    override open func execute() {
        finishWithError(TestOperationError.firstError as NSError?)
    }
}

class GroupOperationTests: XCTestCase {
    func testAggregatedErrors() {
        for _ in 1...100 {
            let exp = XCTestExpectation(description: "Operation not finished")

            var operations: [PSOperation] = []

            var errorsCount = 0

            for errorIndex in 1...100 {
                if errorIndex % 2 == 0 {
                    errorsCount += 1
                    operations.append(ErrorOperation())
                } else {
                    operations.append(PSBlockOperation { })
                }
            }

            let groupOperation = GroupOperation(operations: operations)

            groupOperation.addObserver(BlockObserver { _, errors in
                XCTAssertEqual(errors.count, errorsCount)
                exp.fulfill()
            })

            groupOperation.didEnqueue()
            groupOperation.start()

            wait(for: [exp], timeout: 2.0)
        }
    }
}
