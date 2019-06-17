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

3. Add `MagicBallBackgroundService` target (choose Cocoa Application)
4. Remove the window from it's MainMenu.xib
5. Add a key-value pair to it's Info.plist: 'Application is background only' : YES

We should set 'Application is background only' because we don't want any Dock icon or Main menu in the Menu bar.

---

# Embedding Service into Client application 

6. Go to Client app's `Build Phases` and
- add `MagicBallBackgroundService` to Dependencies list
- add a new `Copy Files` phase with `Destination:` `Wrapper`; set `Subpath` : `Contents/Library/LoginItems`. Press `+` and add `MagicBallBackgroundService`

---

# Set the correct mach label of the Service
7. Download IPC.swift file from #ipc channel (in the pinned message)
8. Add it to both targets
9. Set the `kServiceName` constant to the Bundle identifier of the Service

---

# Configure the Client
10. Go to `AppController` class and implement:
- `start()`
- `stop()`
- `connect()`
- `getDecision()`

---

# Configure the Service
11. Download `Magic8BallService.swift` and `Magic8Ball.swift`
12. Add them to the Service target
13. Implement `start()`, `stop()`, `listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool` and `getDecision(replyBlock: @escaping DecisionReplyBlock)`

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

14. Go through the project and follow the instructions, surrounded by `/// --- PART 2 ---`
