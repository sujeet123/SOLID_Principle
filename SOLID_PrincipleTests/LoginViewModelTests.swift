//
//  LoginViewModelTests.swift
//  SOLID_PrincipleTests
//
//  Created by Sujeet kumar on 17/08/26.
//


//8. Where this pays off — testing
//
//This is the real reward. Because everything depends on protocols, you can write fast, reliable unit tests with no network calls:

import XCTest

final class LoginViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSuccessfulLoginSavesSession() {
        let mockAuth = MockAuthService()
        let mockStore = MockSessionStore()
        let viewModel = LoginViewModel(
            authService: mockAuth,
            sessionStore: mockStore,
            validator: LoginValidator()
        )
        
        let expectation = expectation(description: "login succeeds")
        viewModel.onLoginSuccess = { expectation.fulfill() }
        
        viewModel.login(email: "test@test.com", password: "password123")
        
        wait(for: [expectation], timeout: 1)
        XCTAssertNotNil(mockStore.savedUser)
    }
}
