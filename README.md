Pizzagram
====================

This application, built during week 9 and 10 at [Makers Academy](http://www.makersacademy.com), has the puropse of recreating the famous social media Instagram, with a slight Pizza flavor. It's reachable on [Heroku](http://pizzagrams.herokuapp.com/). This project has enhanced my knowledge of more advanced Rails topics:

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

###Bootstrap integration (second iteration)
To quickly improve the look of our site, we used a popular CSS framework - [Twitter Bootstrap](http://getbootstrap.com/). The front end features added in this iteration are:

	* A responsive grid of images on the front page
	* A fixed navigation bar, with links to Login etc.
	* Improved forms
	* Full-sized images appear in modals

##Tagging (third iteration)
For the third iteration, we added the ability for photos to be tagged, as in the original Instagram, using a [many-to-many relationship](http://guides.rubyonrails.org/association_basics.html#the-has-and-belongs-to-many-association). Given the relative complexity of our tags implementation, we set up unit tests to ensure we've covered all the various edge cases. The features developed via TDD in this iteration are:

	* Users can specify a list of space-separated (or comma separated tags) - e.g. "#yolo, #swag".
	* Tags should be created in the DB if they're novel (have never been used before), otherwise existing tags should be associated with the new post.
	* Duplicate tags (e.g. "#yolo, #yolo") should be stripped out.
	* Tags without a hash (#) at the beginning should be considered invalid.
	* Tags should be displayed underneath each post.
	* Users can click on tags to display *only* posts tagged with that tag.
