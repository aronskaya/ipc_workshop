/*
 * MIT License
 *
 * Copyright (c) 2019 aronskaya (Julia Vashchenko)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

import Foundation

class Magic8BallService: NSObject {
    
    private let machServiceName: String
    
    private let magic8Ball = Magic8Ball()

    
    init(machServiceName: String) {
        self.machServiceName = machServiceName
    }
    
    @available(*, unavailable, message: "Use init(machServiceName:)")
    override init() {
        fatalError()
    }
    
    ///  Starts waiting for incoming XPC connection from the client.
    func start() {
        // 1.
        // what: create a listener for incoming connections
        // how: instantiate an `NSXPCListener` using `init(machServiceName:)`
        
        // 2.
        // what: handle incoming connections
        // how: set listener's delegate to `self`
        
        // 3.
        // what: tell the system, that you are ready to handle incoming connections
        // how: call `resume()` on the listener

    }
    
    /// Invalidates the connection
    func stop() {
        // 1.
        // what: invalidate the listener
        // how: call `invalidate()` on the listener object
    }
}

extension Magic8BallService: NSXPCListenerDelegate {

    public func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
        
        // Here we do almost the same as in `connect()` methods on the client's side, except for #1. — we do not create the connection, as it has already been created by the client. We only configure it.
        
        
        /// --- PART 2 ---
        
        // 2. what: specify, what interface you expect to receive from the other side of the connection
        // how: set connection's `remoteObjectInterface`
        
        /// --- PART 2 ---
        
        
        // 3. what: specify, what interface you will provide to the other end of connection
        // how: set connection's `exportedInterface`
        
        // 4. what: set the object, that will be exported to the other side
        // it should conform to `exportedInterface`
        // how: set connection's `exportedObject`
        
        // 5. what: at least for debugging purposes set handlers, that will be called in case something goes wrong or the connection closes normally when expected
        // how: set connection's `invalidationHandler` and `interruptionHandler`
        
        // 6. what: start the connection
        // how: call `resume()` on the connection
        
        
        /// --- PART 2 ---
        
        // 7. what: if you have set `remoteObjectInterface`, after `resume()` call you get the access
        // to the remote object (the one, that is exported by the other side of connection)
        // how: to acquire the object, call connection's `remoteObjectProxy` and cast it to the `remoteObjectInterface`, that you have specified earlier
        
        // 8. what: start calling the client whenever we have a 'sing' ;) for them
        // how: call tellFortune()
        
        /// --- PART 2 ---
        
        return true
    }
    
    private func tellFortune() {
        
        /// --- PART 2 ---
        
        // what: pass the random emoji to the client
        // how: call `receiveSign()` on the object, exported by the other side of the connection
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds((5...15).randomElement()!)) { [weak self] in
            self?.tellFortune()
        }
        
        /// --- PART 2 ---
    }
}

extension Magic8BallService: Magic8BallServiceProtocol {
    
    func getDecision(replyBlock: @escaping DecisionReplyBlock) {
        
        // 1.
        // what: call the replyBlock with a decision, provided by the magic8Ball
    }
}
