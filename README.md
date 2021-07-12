LAAuthentication, playing with LocalAuthentication. 

LA handle touchID and FaceID

I created a framework with a method `evaluatePolicy`. You can use to test it. 

```Swift

LAuthentication.shared.evaluatePolicy(reason: "Ajam!! Pium pium") { (success) in
    if(success){
        self.showAlert(title: "Success" , message: "You can look some secrets properties")
    }else{
        self.showAlert(title: "Authentication failed" , message: "You could not be verified; please try again.")
    }
} rejected: { (error) in
    self.showAlert(title: "Biometry unavailable" , message: "Your device is not configured for biometric authentication.")
}

```

Enjoy!
Dambert Munoz,
Software Engineer 
