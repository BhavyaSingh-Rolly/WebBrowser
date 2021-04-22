/*
  Filename: README
  Author: Bhavya Singh
  Date : March 28, 2021
*/
 
Mobile Web Browser
 
This app is a mobile web browser. It was developed using the latest iOS
 on iphone 11 simulator.

Description :
After opening the app, the user is presented with a blank page on the
browser, search bar on the top and several buttons on the toolbar at the
bottom. The user can enter their desired URL in the search bar. If a valid
URL is inputted, the webpage of that URL is loaded on to the screen. If an
invalid URL or empty string is entered, then a blank page is loaded and the
user is prompted in the search bar to enter a valid URL.
The anticlockwise button is used to refresh the current page. The left
arrow button goes back to the previous webpage. The right arrow button moves
forward to the next webpage. The minus button removes the current tab and
loads the first tab. The plus button adds a new tab with a blank page. The
"Tabs" button shows a table containing the tabs with their respective URL and
thumbnails. The user can select the tab they want to switch to in this table.
They can also swipe down to exit the table. While surfing the web, the search
bar reflects the URL of the current page.

1. Running Project :
To run the app, open file Web Browser.xcodeproj in XCode and run the
simulator on latest iOS using Command+R or Product -> Run in toolbar.
 
2. Additional Features :
The tab switch table shows the different tabs with their respective URLs
and thumbnails. The thumbnails allow the user to preview each tab's content
before switching to it.
 
3. Product Approach :
All of the buttons are on the same toolbar and mostly represented with
symbols, (i.e. plus, minus, ... ) to create a clean and organized UI.

I chose to forgo storing and restoring each tab's history, due to time
constraints.

I implemented a tab switch with a table rather than collection view. Each
row of table view has only one cell. Thus, table view cells usually have
greater width than collection view cells. This allows the user to see the
most of the URL on a single line.
