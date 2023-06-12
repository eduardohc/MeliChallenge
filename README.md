**MeliChallengeAPI**

This repository contains the code for an iOS app called MeliChallengeAPI. The app allows users to search for items using the MercadoLibre API and view detailed information about the selected item.

**Features**

MVVM architecture pattern
Network requests using URLSession
JSON decoding with ObjectMapper
Asynchronous image loading
Unit tests for various components

**Installation**

To run the app locally, follow these steps:

Clone the repository: git clone <repository-url>
Open the project in Xcode
Build and run the app on the desired simulator or device


 **Usage**
  
The app consists of the following screens:

Main Screen: Displays a search field, a search button, a table view to show search results, and an empty view when no items are available.

Item Detail Screen: Shows detailed information about the selected item, including its description, condition, price, and an image.

**Code Highlights**
  
ViewController: Handles user interactions on the Main Screen, such as searching for items and updating the table view. It also navigates to the Item Detail Screen when an item is selected.

NetworkService: Performs network requests to fetch items from the MercadoLibre API using URLSession. It parses the JSON response and maps it to the Item model.

ItemViewModel: Manages the data and business logic related to items. It uses the NetworkService to fetch items and updates the items array. It also provides a completion closure to notify the caller of the fetch status.

ItemDetailVC: Displays the detailed information of a selected item. It sets the item's properties to the corresponding UI elements, including the item description, condition, price, and image. The image is loaded asynchronously from the provided URL.

**Future Improvements**
Improved error handling and error messages for network requests.
Implementing caching mechanisms for fetched items and images.
UI enhancements and better user feedback during network operations.

Please note that this is a sample README file, and you should update it according to your project's specific details, such as project structure, installation instructions, usage guidelines, and license information.

Feel free to add any additional sections or details that are relevant to your project.
