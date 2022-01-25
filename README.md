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

#### Additional sources:

##### ◽ Setup cocoapods at mac M1
- open terminal using rosetta (select Terminal and press cmd(⌘)+I and check the "Open using Rosetta" option) check `zsh:` mark in terminal
- instal brew (>1.5GB !!!) `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` 
- `brew cleanup -d -v` 
- `brew install cocoapods `
- `pod setup --verbose`


##### ◽ Embed cocoapod in project

- **Attention!** :1: use only ROSETTA terminal version!!! :point_up:
- open root project folder
- `pod init` - init and create podfile
- `open -a "TextRedactorName" Podfile`
- uncomment and correct minimum ios version `platform :ios, '13.0'`
- follow instructions for current library and redact podfile
- close podfile and `pod install`
- :point_up: further use only .xcworkspace to open project

