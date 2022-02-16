# Udemy-IOS-Dev-Bootcamp
*My solutions for Udemy course iOS &amp; Swift - The Complete iOS App Development Bootcamp*

---
## Structure: ##
### Section 3 Xcode Storyboard and Interface Builder ### 
> course section number and name

[TASK](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16251044#announcements)
> link to the task 
#### Description ####
> Description if it's realy need

**#3.01**
> Commit tag  
---
# LIST OF COMMITED FILES GOES FROM HERE: #

### Section 3 Xcode Storyboard and Interface Builder ### 

[TASK](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16251044#announcements)
simple app without any fuctionality - jast showing a picture and a few lables 

**commit #3.01**

### I Am Poor ###
---
### Section 5 Swift Prigramming Basics ### 

[TASK](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16252392#overview)
app with simple functionality - add immage, lable, buttom; change them randomly    

**commit #5.50**

### Magic-8-Ball ###

---
### Section 7: Using and Understanding Apple Documentation ### 

[TASK](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16252746#overview)
app with simple functionality - play sound, change button's property after delay (using async DispatchQueue)   

**commit #7.78**.  
### Xylophone ###
---    
### Section 8: Intermediate Swift Programming - Control Flow and Optionals
[TASK](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16252792#overview)
app with simple functionality - plaing sound, using ProgressBar, using Timer, change label's text after delay   
**commit #8.81**.  
### Egg Timer ###
---     
### Section 9: iOS App Design Patterns and Code Structuring
[TASK](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16252942#overview)
app with simple functionality - MVC, using ProgressBar, using Timer, change label's text after delay, change text on button  
**commit #9.106**.  
### Quizzler Multiple Choice ###
---
### Section 10: iOS App Design Pattern Challenge
[TASK](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16253100#overview)
app with simple functionality, MVC home exercise - MVC, change label's text, change text on button  
**commit #10.109**.  
### Destini ###
---
### Section 11: Advanced Swift Programming - Classes, Inheritance & Advanced Optionals
[TASK](hhttps://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16253370#overview)
app with simple functionality - 2 screens, segue, preparation, MVC, sliders.  
**commit #11.119**.  
### Bmi Calculator ### 
---    
### Section 12: Advanced Swift Programming Challenge
[TASK](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16253434#overview)
self made app  - layout practice, stepper, 2 screens, segue, preparation, MVC.   
**commit #12.132**.   
### Tipsy ###
---    
### Section 13: Networking, JSON Parsing, APIs and Core Location
[TASK](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16253648#overview)
app with different tasks  - networking, async, parsing, location, textField, sf simbols  
#### Additional sources: 
- [free weather api](https://openweathermap.org/api)
- [coreLocation tutorial](https://www.raywenderlich.com/5247-core-location-tutorial-for-ios-tracking-visited-locations)
- [URLSession tutorial](https://www.raywenderlich.com/3244963-urlsession-tutorial-getting-started)

**commit #13.142**.   
### Clima ###
---
### Section 14: Networking and API Challenge 
[TASK](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16253856#overview)
cmplitely self made app with different tasks  - picker, networking, async, parsing, sf simbols
#### Additional sources: 
- [free api hub](https://rapidapi.com/hub)
- [cbr currency api](https://www.cbr-xml-daily.ru/daily_json.js)

**commit #14.163**.   
### Ruble Currency Checker ###
---
### Section 15: Firebase Cloud Firestore, TableViews and Cocoapod Dependencies
[TASK](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16813258#overview)
complex chat app with different tasks  - using cocoapod, SPM. Firebase Firestore, Firebase Auth. Segue, TableView, NavigationView, keyboard and view interraction (IQManager lib), xib file, async typing label (selfmade - 4 ways and lib) . App and View lifecycle.

#### Additional sources:
- [read about cocoapods](https://habr.com/ru/post/261711/)

##### ◽ Setup cocoapods at mac M1
- open terminal using rosetta (select Terminal and press cmd(⌘)+I and check the "Open using Rosetta" option) check `zsh:` mark in terminal
- install brew (>1.5GB !!!) `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` 
- `brew cleanup -d -v` 
- `brew install cocoapods `
- `pod setup --verbose`


##### ◽ Embed cocoapod in project

- **Attention!** use only ROSETTA terminal version!!! :point_up:
- open root project folder
- `pod init` - init and create podfile
- `open -a "TextRedactorName" Podfile`
- uncomment and correct minimum ios version `platform :ios, '13.0'`
- follow instructions for current library and redact podfile
- [look cocoapods guide](https://guides.cocoapods.org/using/the-podfile.html) to set library version 
- close podfile and `pod install`
- :point_up: further use only .xcworkspace to open project
- try build project
- in case of mistakes or warnings check the git page of library - *pull requests -> files changed* and try to make the same changes in embeded library, check  the latest version in git and installed version, open file *git->.podspec* and compare versions. Then do `pod install` again

##### ◽ Delete library from project

- change class inheritance to default classes
- in podefile remove dependency for this library `pod 'CLTypingLabel', '~> 0.4.0'`
- `pod init` 


##### ◽ Update Dependencies

- `pod update` update dep.
- `pod update library_name` update only library_name dep.
- `pod outdated` show outdated dep.

**commit #15.197**.   
### Flash Chat ###
---
### Section 17.1: SwiftUI and Declarative Programming
[TASK](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16254096#overview)
SwiftUI simple app - stack, image, views, frame, shape. Export Font. Extract View.
 
#### Additional sources:
- [Color: convert rgb to swif format](https://www.uicolor.io/#/hex-to-ui)
- [Color: choose color](https://flatuicolors.com/)
- [Font: Google](https://fonts.google.com/)
#### Attention! ☝️ XCode 13 doesn't create *info.plist*! Add Fonts and any other dep. as:  
`Project -> Targets -> Info -> Custom iOS Target Properties`  
`+ Fonts Provided By Applicaton` add item  
[stackoverflow](https://stackoverflow.com/questions/67896404/where-is-info-plist-in-xcode-13-missing-not-inside-project-navigator)

**commit #17.208**.
### MakeevCard ###
---
### Section 17.2: SwiftUI and Declarative Programming
[TASK](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16254110#overview)
SwiftUI simple app - @State, button.  

**commit #17.211**.
### Dicee-SwiftUI ###
---
### Section 17.3: SwiftUI and Declarative Programming
[TASK](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16254126#overview)
SwiftUI app - 2 screens, Observer, networking, list, UIKit connection, WebKit

⚠️ Bug: ex. 215 compilar warning <...Unable to simultaneously satisfy constraints...> connected with NavigationView.

[decision stackoverflow](https://stackoverflow.com/questions/65316497/swiftui-navigationview-navigationbartitle-layoutconstraints-issue). 

`.navigationViewStyle(StackNavigationViewStyle())` add right after NavigationView scope

**commit #17.217**
### NewsReader ###
---
### Section 19: Local Data Persistence - User Defaults, Core Data and Realm
[TASK](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/10929420#overview)
app with different tasks  - networking, async, parsing, location, textField, sf simbols  
#### Additional sources: 
- [Xcode Intellisense - stackoverflow](https://stackoverflow.com/questions/6662395/xcode-intellisense-meaning-of-letters-in-colored-boxes-like-f-t-c-m-p-c-k-etc)

#### Tree Ways To Save App Data
1. *Defaults* 
- only for simple state defaults data (volume, state pointer etc.). 
- Only one .plist!
- Never use it for mutating state during app work.
- Use only for sate initialasing. 
- Only base types.
``` swift
let defaults = UserDefaults.standard
var itemArray = ["a", "b"] // app data
let items = defaults.array(forKey: "ItemArray") // download data from plist
itemArray.append("c") // change data in app
defaults.set(itemArray, forKey: "ItemArray") // set defaults data
```

2. *User Property Lists* 
- For sipmle and light data
- One definite list for one object
```swift
// class scope:
let encoder = PropertyListEncoder() // saving data must apply Codable
let decoder = PropertyListDecoder()
 // get path to new .plist
    let dataFilePath = FileManager
        .default
        .urls(for: .documentDirectory, in: .userDomainMask)
        .first?
        .appendingPathComponent("Items.plist")
// ......view data ...........
loadData()
//............................
// ......mutating data .......
saveData()
//............................
func saveData() {
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding \(error)")
        }
    }
func loadData() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            do {
                itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("Error dencoding \(error)")
            }
        }       
    }
```
3. 
