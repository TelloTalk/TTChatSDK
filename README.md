# TelloTalk SDK - iOS

TelloTalk SDK is a solution for integrating chat messaging in your application.

## Pre Requisites
You must have **Access Key** & **Project Key** to use this SDK in your application.

## Installation
Add **TTChatSDK.xcframework** file provided into your application, then select you application target, in *General* tab, then add .framework file in *Embedded Binaries*

*or*
```
pod 'TTChatSDK'
````

*or*

Add `https://github.com/TelloTalk/TTChatSDK.git` as a swift package.


## Usage

### Initializaition

```swift
import TTChatSDK
```

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    do {
        try TTChat.shared.setup(accessKey: "<ACCESS_KEY>", projectToken: "<PROJECT_KEY>")
    } catch let error { 
        print(error)
    }
    return true    
}
```

### Configuration
For setting live API in sdk
```swift
TTChat.shared.environment = .live
```
For setting staging API in sdk
```swift
TTChat.shared.environment = .staging
```
For setting self hosted API in sdk
```swift
TTChat.shared.environment = .selfHosted(url:"<SELF_HOSTED_API>")
```

Note: It is important to ensure that the above variable is set before registering. This is because the variable will only be initialized once, and if it is set after any function or API call, it will not have any effect. Therefore, it is crucial to set the variable at the appropriate time to ensure that it is properly initialized.

### Receiving Messages Notifications (APNS)

#### Step 1:
Create Certificate and upload it to provided panel or contact tech@tilismtech.com

[Establishing a Certificate-Based Connection to APNs](https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/establishing_a_certificate-based_connection_to_apns)

#### Step 2:
In `AppDelegate.swift`

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    application.registerForRemoteNotifications()
    return true
}
```

#### Step 3:
```swift
func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    TTChat.shared.didRegisterForRemoteNotifications(with: deviceToken)
}

```

#### Step 4:
Turn On `Push Notifications` from *Capabilities* by selecting your target

### Register User
When you're logging in or signing up the application for the first time you need to call this, if there is error then you will get value in `errorString` otherwise it will be nil
```swift
TTChat.shared.registerUser(profileId: "<ProfileId>", name: "<Name>", mobileNumber: "<Mobile Number>") { [weak self] (buddy, errorString) in
    guard let self = self else { return }
}
```

### Corporate List UI of TelloTalk SDK

#### Method 1:
You can directly open corporate list, you can set `title` of that list if you want otherwise pass `nil`
```swift
TTChat.shared.showCorporateUsers(controller: self, title: "Title")
```

#### Method 2:
You can fetch list of departments by implementing 'getCorporateDepartments' function

```swift
 TTChat.shared.getCorporateDepartments(dataSource: self) { (error) in 
    print(error)
 }
```
Conform 'DepartmentUpdates' protocol and get departments in 'departmentFetched' function

```swift
 func departmentFetched(departments: [CorporateDepartments]) {
        print(departments)
    }
```
Finally show chat screen by calling 'showChatScreen' function

```swift
TTChat.shared.showChatScreen(controller: self, contactId: contactId, deptName: deptName, isCorporateContact: isCorporateContact, dType: dType, firstMessage: firstMessage)
```

### Unread Message Count:
```swift
TTChat.shared.getTotalUnreadMessageCount { [weak self] (count) in
    guard let self = self else { return }
}
```
`count` will be the unread messages count

### Permissions for Chat:
*  `NSCameraUsageDescription` - For sending images/video from camera
*  `NSPhotoLibraryUsageDescription` - For sending images/video from photo library
*  `NSContactsUsageDescription` - For sending contacts and syncing contacts (if required)
*  `NSLocationWhenInUseUsageDescription` - For sending location message
*  `NSMicrophoneUsageDescription` - For sending audio note message

### UI Customizations:
```swift

TTChat.shared.settings.outgoingMessageBubbleColor = .green
TTChat.shared.settings.outgoingMessageBubbleTextColor = .white
TTChat.shared.settings.incomingMessageBubbleColor = .green
TTChat.shared.settings.incomingMessageBubbleTextColor = .white
TTChat.shared.settings.messageStateIconColor = UIColor.init(white: 0.8, alpha: 1)
TTChat.shared.settings.readIconColor = UIColor(red: 0, green: 255/255, blue: 71/255, alpha: 1)
TTChat.shared.settings.timeOutgoingColor = UIColor.init(white: 0.9, alpha: 1)
TTChat.shared.settings.timeIncomingColor = UIColor.init(white: 0.9, alpha: 1)
TTChat.shared.settings.audioRecordButtonColor = .systemGreen
TTChat.shared.settings.sendButtonColor = .systemGreen
TTChat.shared.settings.navBarTintColor = .black
TTChat.shared.settings.navBarColor = .white
TTChat.shared.settings.primaryColor = .systemGreen
TTChat.shared.settings.backButtonIcon = UIImage(named:"back_button")!
TTChat.shared.settings.chatScreenBackgroundColor = .gray
```
