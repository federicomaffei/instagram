Pizzagram
====================

This application, built during week 9 and 10 at [Makers Academy](http://www.makersacademy.com), has the purpose of recreating the famous social media Instagram, with a slight Pizza flavor. It's reachable on [Heroku](http://pizzagram.herokuapp.com/). 
This project has enhanced my knowledge of more advanced Rails topics likes:

* Uploading and processing images using Paperclip, hosting via Amazon S3
* Managing secret information (e.g. private keys)
* Many-to-many relationships in Rails (with tagging)
* Geocoding with Google Maps
* Twitter Bootstrap
* Creating APIs using Rails + [jBuilder](https://github.com/rails/jbuilder)

![PIZZAGRAM](https://dl.dropboxusercontent.com/u/9315601/pizzagram.png)

====================

##The features I implemented via TDD are:

###Image uploading (first iteration)
For the initial version the core functionality of Instagram has been duplicated - users can upload their photos. To persist the images we used [Amazon S3 (Secure Storage Service)](http://aws.amazon.com/s3/). The features developed via TDD in this iteration are:

	* Users can register/sign up (implemented with Devise).
	* Users must be signed in to create a new posts.
	* Posts can be created by providing a title and attaching an image.
	* The image should be processed using [Paperclip](https://github.com/thoughtbot/paperclip), to generate thumbnail-sized images.
	* The homepage should list all the uploaded thumbnails - users can click through to see full-sized images.
	* Images are hosted on S3. Stub calls to S3 for your test environment.
	* Ensure that the S3 secret key is not stored on Github.

###Bootstrap integration (first iteration and a half)
To quickly improve the look of our site, we used a popular CSS framework - [Twitter Bootstrap](http://getbootstrap.com/). The front end features added in this iteration are:

	* A responsive grid of images on the front page
	* A fixed navigation bar, with links to Login etc.
	* Improved forms
	* Full-sized images appear in modals

###Tagging (second iteration)
As a second iteration, we added the ability for photos to be tagged, as in the original Instagram, using a [many-to-many relationship](http://guides.rubyonrails.org/association_basics.html#the-has-and-belongs-to-many-association). Given the relative complexity of our tags implementation, we set up unit tests to ensure we've covered all the various edge cases. The features developed via TDD in this iteration are:

	* Users can specify a list of space-separated (or comma separated tags) - e.g. "#tag, #other-tag".
	* Tags should be created in the DB if they're novel (have never been used before), otherwise existing tags should be associated with the new post.
	* Duplicate tags (e.g. "#tag, #tag") should be stripped out.
	* Tags without a hash (#) at the beginning should be considered invalid.
	* Tags should be displayed underneath each post.
	* Users can click on tags to display *only* posts tagged with that tag.

###Geocoding and Maps (third iteration)
As a third iteration, the service has been made location-aware. The features developed via TDD in this iteration are:

	* Users can enter an address when creating a post.
	* Posts with addresses display a link to "View Map".
	* When a visitor views the map a call is made to Google server's to geocode the address, then a map is rendered, centered on the resulting location.
	* A clickable marker should be pinned at the location of the photo. Clicking it displays the photo's title and `created_at` date.
	* Use the Geolocation API to prefill the address field with the user's current address.

###Websocket "like" functionality (fourth iteration)
As a fourth iteration we added the ability to "like" a post. The features developed via TDD in this iteration are:

	* Users can like a post.
	* The new "like" is immediately shown on all of the open instances of the page, via [Websockets](https://github.com/websocket-rails/websocket-rails).
	* A user can only like a post once.

###Order page and Stripe payment functionality (fifth iteration)
As a fifth iteration the ability to sell prints of the pictures has been added. The features developed via TDD in this iteration are:
	
	* An Order show the email of the customer, an order number and the product name.
	* An Admin can see the all the details of all the placed Orders. The Admin cannot sign up, only be added via seeding.
	* Users can place Orders, and pay for the placed order. A confirmation email is sent to the customer.

====================

###The programming languages and technologies I used are:

  * Ruby

  * Javascript / JQuery

  * Rails framework

  * Rspec

  * Capybara

  * PhantomJS / Poltergeist

  * AJAX

  * JBuilder

  * SCSS

  * Google Maps API

  * Stripe

====================

###How to run the application:

  * In the browser enter: [http://pizzagram.herokuapp.com/](http://pizzagram.herokuapp.com/)

###How to test the application:

  * From command line enter:
```bash
git clone git@github.com:federicomaffei/pizzagram.git
cd pizzagram
rspec
```

====================

