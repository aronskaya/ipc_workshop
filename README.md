# Part 1: talking to the Service

---

For this part, omit instructions, surrounded with<br />`/// --- PART 2 ---`

---

1. Download starter project from github (link is specified in the pinned message in #ipc Slack channel)
2. Launch it, see, what it has.

---

![](Magic8Ball/Resources/Assets.xcassets/ball.imageset/magic-8-ball-eight-isolated-vector-21312099.png)

---

# Add background service

3. Add `MagicBallBackgroundService` target (choose Cocoa Application).
4. Remove the window from it's MainMenu.xib  or Main.storyboard (whichever you have)
5. Add a key-value pair to it's Info.plist: 'Application is background only' : YES
6. Go to  `MagicBallBackgroundService` target's capabilities and switch App Sandbox off. 

Sidenote 1: XPC works with Sandbox enabled, just another setup is required.
Sidenote 2We should set 'Application is background only' because we don't want any Dock icon or Main menu in the Menu bar.

---

# Embedding Service into Client application 

7. Go to Client app's `Build Phases` and
- add `MagicBallBackgroundService` to Dependencies list
- add a new `Copy Files` phase with `Destination:` `Wrapper`; set `Subpath` : `Contents/Library/LoginItems`. Press `+` and add `MagicBallBackgroundService.app`

---

# Set the correct mach label of the Service
8. Download `ipc_additional_files.zip` file from #ipc channel (in the pinned message) and unpack it
9. Add IPC.swift to both targets
10. Set the `kServiceName` constant to the Bundle identifier of the Service

---

# Configure the Client
11. Go to `AppController` class and implement:
- `start()`
- `stop()`
- `connect()`
- `getDecision()`

---

# Configure the Service
12. Download `Magic8BallService.swift` and `Magic8Ball.swift`
13. Add them to the Service target
14. Implement `start()`, `stop()`, `listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool` and `getDecision(replyBlock: @escaping DecisionReplyBlock)`
15. In the AppDelegate class make a property of `Magic8BallService` instance.
16. Call `start()` on this instance in `applicationDidFinishLaunching()`.
17. Call `stop()` on this instance in `applicationWillTerminate()`

---

# Run the project!
Run the Client target.
Think of a Yes-No question and double-click the ball to see if you get the answer.

---

# Part 2: talking to the Client

---

Let's say, that background service wants to send the user 'Signs' about their future.
To do that it needs to be able to call the Client application and pass it the 'Sign'.

---

18. Go through the project and follow the instructions, surrounded by `/// --- PART 2 ---`

**Notes**:
- open `Activity Monitor` application and search for 'magic' to see, if both apps are running
- in order to terminate the background service you should manually quit the main application
- the background service is not automatically attached to Xcode. You can attach to it manually or add some `NSLog()` logs and see them in the `Console` application
