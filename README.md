# PeekProject

I must confess this was a bigger challenge than I originally thought when I first saw the email containing the challenge. 
I originally decided to look for third party API's that could help communicating with a graphQL backend, and immediately came to Apollo which seemed to be the best solution according to everybody on the internet. This just didn't work for me and I am not sure why. I even did a few very detailed tutorials that didni't seem to work. Everytime I tried creating the run script to connect my queries with the scheme.json file, it wouldn't connect. Either way it was taking too much time and I decided I was going to do the project without using a third party API, and it once again proved more difficult than I thought it would.

The bulk of my time was spent figuring out how to structure my URL Request to get the data that I needed to get. Once I finally got that working it was just building out the UI. Choosing SwiftUI was an easy decision for me to work because their lazyStacks are a really good way to make sure that nothing is loaded onto the screen until it needs to be. 

The pagination happens when the last item in the array gets loaded, the API fetch happens again and grabs the next 20 items available. 

Given more time I would have liked to connect to Keychain or find another way to securely store my Personal Access Token given from Github. Currently that is the main issue with the app. Once I pushed and created my repository here on Github I immediately received an email from Github saying that my personal access token was included in the app and that it was going to be removed for my security. So in other words if you download this app and run it, it isn't going to fetch anything until i put in a new access token. So again given more time i would find a way to add that securely. 




https://user-images.githubusercontent.com/47044311/153119825-4eba9c1e-9027-41e0-820e-7dc74c97cf07.mov

![Simulator Screen Shot - iPhone 13 Pro Max - 2022-02-08 at 21 37 13](https://user-images.githubusercontent.com/47044311/153119829-439f0330-a330-4e04-82de-06831c404cb9.png)
