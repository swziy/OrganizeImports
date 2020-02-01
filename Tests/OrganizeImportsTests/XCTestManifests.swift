import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(OrganizeImportsTests.allTests),
    ]
}
#endif
