# Kitchen Kounter
### by: Joshua Turner
Have you ever stopped yourself from buying more barbaque sauce because you're *pretty sure* you have it at home, only to get home and find out it's been expired for the past two months? How many times have you bought flour because you weren't sure you'd have enough for that batch of cookies you're planning on baking this weekend only to get home and find you had two nearly full bags already? Are you tired of needing to take stock of your kitchen every time you need to run to the grocery store? Let us keep track of what's in your kitchen, so you can focus on what you'd like to cook.

Kitchen Kounter is a kitchen inventory manager designed to keep track of what you have so you don't have to. It also helps you build your shopping list based on what you're currently low on!

## Instructions for use:
There are four main pages in the Kitchen Kounter app:

**My Kitchen** is the place where your inventory is maintained. When first running the app the list will be empty, but you can add a new item by pressing the floating action button in the bottom right of the screen. After the list has some items, you'll notice that each item displays it's name, current quantity, and expiration date. Clicking on any list item will allow you to edit it. In the top left you'll see the menu button that opens the drawer, from which you can navigate to the shopping list. In the top right you'll see a shopping cart icon button which will add all items currently low on stock (= 0) to the shopping list for you automatically.

**Add Stock Item** screen is where you'll add to your current inventory manually. Here you can specify a name, a quantity, a measurement for that quantity (from a predefined list) and an expiration date. You will be brought to this screen (with some minor edits) whether you chose to add or edit a stock item. If you're editting an item, field will be prepopulated for you. When you're done you can save your changes by hitting the "Add Item" button (or "Save Item" if editting). If you wish to leave this screen without saving, you can hit the back arrow in the top left.

**Shopping List** is where we'll keep track of everything you may need to buy on your next grocery run. When you first use the app this list will be empty, but you can add items by pressing the floating action button in the bottom right. When items are listed, you'll see each item has a checkbox that can be tapped to mark and item as "purchased", and the name of that item. In the top left we again have the menu button to open the drawer, from which you can navigate back to My Kitchen. In the top right you'll see a check icon button, which when pressed will clear any purchased items from your shopping list and update your stock. When this is done, the system recognizes whether an item already exists in your kitchen by name, and if it does, will simply update the quantity to whatever amount you say you purchased. Otherwise, it will add it the stock list.

**Add Shopping List Item** screen is where you'll be brought to add items manually to the shopping list, or edit items if you've click on a particular list item. Here you'll be able to fill out name, quantity, measurment (from a predefined list), and whether or not the item has been purchased. If you're editting an item, the field will be prepopulated for you. When you're done you can save by hitting the "Add Item" button (or "Save Item" if you're editting). If you wish to leave this screen without saving, you can hit the back arrow in the top left.

## Special Info to Run the App:
This app was built using VS Code with the Flutter and Dart plugins, and testing using the Android Studio Emulators. However, you should be able to run this project using a variety of environments, including Android Studio and the terminal. Detailed instructions can be found at: https://flutter.dev/docs/get-started/test-drive?tab=vscode

## What I've Learned:
One of my main goals with this project was to begin learning Dart and Flutter, which I've achieved. I've realized through this process that while new technologies are fun and exciting, support can be sparse. I will have a lot more expirmenting to do before I can consider myself proficent in either technology. Thanks to this project I've also begun to grasp the importance of intelligent design. As my vision for the project grew, I watched the code grow, and now it's at a point where it will need major refactoring before moving forward. I've learned that this is something I enjoy. This a project that has allowed me to build something I have a use for, and because of that I'm excited to continue building it and learning all the things Flutter and Dart have to help me achieve that.