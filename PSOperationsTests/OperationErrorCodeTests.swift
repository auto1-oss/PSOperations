@testable import PSOperations
import XCTest

class OperationErrorCodeTests: XCTestCase {

    func testOperationErrorCodeEqualityLHS() {
        let opErrorCode = OperationErrorCode.conditionFailed

        XCTAssertTrue(opErrorCode == 1)
    }

    func testOperationErrorCodeEqualityLHS_wrong() {
        let opErrorCode = OperationErrorCode.conditionFailed

        XCTAssertFalse(opErrorCode == 2)
    }

    func testOperationErrorCodeEqualityRHS() {
        let opErrorCode = OperationErrorCode.executionFailed

        XCTAssertTrue(2 == opErrorCode)
    }

    func testOperationErrorCodeEqualityRHS_wrong() {
        let opErrorCode = OperationErrorCode.executionFailed

        XCTAssertFalse(1 == opErrorCode)
    }
}
