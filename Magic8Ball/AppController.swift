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

import AppKit
import ServiceManagement

class AppController: NSObject {
    
    private var window: Magic8BallWindow? {
        didSet {
            window?.doubleClickHandler = { [weak window, weak self] in
                window?.shake()
                self?.getDecision()
            }
        }
    }
    
    func start(window: Magic8BallWindow) {
        self.window = window
        // what: To establish the XPC connection to the Service we need launchd to know about it.
        // how: call a function from `ServiceManagement` framework
        // SMLoginItemSetEnabled(kServiceName as CFString, true)
        
        connect()
    }
    
    func stop() {
        // what: unregister the Service with launchd (it will be terminated immediately and it will not launch on system startup)
        // how: call SMLoginItemSetEnabled(kServiceName as CFString, false)
        
        // invalidate the connection
    }
    
    private func connect() {
        
        // 1. what: create a connection
        // how: instantiate an XPCConnection using init(machServiceName:, options:) initializer
        
        // 2. what: specify, what interface you expect to receive from the other side of the connection
        // how: set connection's `remoteObjectInterface`
        
        
        
        
        /// --- PART 2 ---

        // A. what: specify, what interface you will provide to the other end of connection
        // how: set connection's `exportedInterface`
        
        // B. what: set the object, that will be exported to the other side
        // it should conform to `exportedInterface`
        // how: set connection's `exportedObject`
        
        /// --- PART 2 ---
        
        
        
        // 5. what: at least for debugging purposes set handlers, that will be called in case something goes wrong or the connection closes normally when expected
        // how: set connection's `invalidationHandler` and `interruptionHandler`
        
        // 6. what: start the connection
        // how: call `resume()` on the connection
        
        // 7. what: if you have set `remoteObjectInterface`, after `resume()` call you get the access
        // to the remote object (the one, that is exported by the other side of connection)
        // how: to acquire the object, call connection's `remoteObjectProxy` and cast it to the `remoteObjectInterface`, that you have specified earlier
    }
}

extension AppController {
    
    func getDecision() {
        
        // 1. what: ask the Service to provide the decision for given question
        // how: call getDecision(replyBlock:)
        
        // 2. what: show received decision to the user
        // how: set the received string to self.window?.label
    }
}


//extension AppController: Magic8BallClientProtocol {
    
    func receiveSign(_ sign: String) {
        // what: receive a 'sign' from the other side of the connection and show it to the user
        // how: set the received string to self.window?.emojiLabel
    }
//}
