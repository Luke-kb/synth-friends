# Borrows

______

[Link to deployed site](https://ca-borrows.herokuapp.com/)

[Link to Repo](https://github.com/Luke-kb/borrows)

## T2A2 Marketplace Project

### Purpose

*Borrows* is a two-way renting and lending marketplace for hardware synths and related instruments (such as drum machines and sequencers).

### Problem/Solution

Synthesisers are plentiful and expensive to purchase. New synthesisers are released every few months by companies based all around the world. The used synth market is always crowded, and most people who own synths own multiple units. 

Perhaps you are unable to afford the outlay to purchase; or only require the instrument for a short period of time (ie for a recording project or concert); or wish to try out an instrument before purchasing. Most shopfront (or online) dealers do not provide an affordable way to rent these instruments and those who do usually do not have a wide selection and are also usually located in large cities. *Borrows* allows synth enthusiasts to connect and share their wares where ever they are located, while earning an income on the side and contributing the musical community.

### Target Audience

The target audience of *Borrows* are synth or audio enthusiasts from novice to professional seeking to loan instruments they aren't using for an income stream, or rent instruments they wouldn't otherwise have access to.

### Tech Stack

* Design/Wireframes: **Balsamiq**
* Front-End: **HTML5, CSS3, SASS, Javascript(JQuery)**
* Back-End: **Ruby 2.7.0, Rails 6.0.3.2***
* Development: **Git, Github, VSCode**
* Deployment: **Heroku**, **PostgreSQL**

### Explain the different high-level components (abstractions) in your App

*Borrows* is a marketplace designed for renting and lending. Users can sign up, create a profile and post listings for gear that they own. A user can be a lender, renter or both at any time. Lender's have the financial incentive to set their own price for rental of their listings.

#### Listing

A Listing is an item that is posted by a user and containing image, title, category, brand, description and price (per day) information with the intention of providing an authentic representation of the item. Users can edit their listing to show as 'available' or 'unavailable' without having to delete it and are view-able by all users.

#### User & Profile

Registered users are prompted to create a Profile immediately upon sign-up (taken care of by `devise`) and contains a users first and last name, location (postcode) and a short bio as well as an image. Profiles are also view-able by all users.

#### Loan

A Loan is a current listing owned by one user that is being rented by another user. It provides the start and end date of the loan and the total cost. 

### List and describe any 3rd party services. Precisely explains and  shows understanding of the different high-level components of the app

*Borrows*, in it's current state, utilises a number of third-party services and ruby gem packages.

For the deployment and hosting of the application, the *Heroku* platform and the PostgreSQL database solution was chosen. Heroku is a popular deployment solution with many features available for free and plays well with PostgreSQL.

Image upload capability is implemented using Amazon Web Services (specificially S3 bucket storage) with support from the the `aws-sdk-s3` gem. This allows a streamlined approach to linking Rails ActiveStorage blobs (where the key to locate the image is stored along with additional metadata about the image) with their location on the AWS server. 

The CanCanCan gem (an up-to-date derivative of CanCan) is used to implement authorisation rules. These are defined in a model class named `Ability`. This allows a simply way to authorise CRUD actions depending on the type of user accessing that particular model data.

```ruby
class Ability
  include CanCan::Ability

  def initialize(user)
    #for guest user
    user ||= User.new
  
    if user.admin?   #admin can CRUD all
      can :manage, :all
    else
      can :read, :all  #user can read all if not logged in
    end
    if user.present? #user when logged in can manage listings and profiles owned by them
      can :manage, Listing, :lender_id => user.id
      can :manage, Profile, :id => user.id
    end
  end
end
```

In future versions, the developer plans to integrate a payment system provided by *Stripe*, location UI by Google GeoCoder and a user messaging system.

### Identify the problem you’re trying to solve by building this  particular marketplace App and why it needs solving

Renting and Lending options for musical instruments are often provided entirely by musical instrument shopfronts that:

- often specialise in a narrow range of instruments
- are located in one place (usually a main city) and have a limited amount of items they can own/lend/maintain/store
- have a large overhead that often gets carried over to the lender
- don't offer an online way to connect with the musical community

Utilise an e-commerce platform  marketplace like *Borrows* providing  users the opportunity to own  the renting/lending transaction themselves can:

- reduce the cost of renting instruments

- provide a source of income for lenders

- increase the number of items available to lend 

- socially contribute to the greater community of musicians

  

### Describe your project’s models in terms of the relationships (active record associations) they have with each other. 

There are seven entities that form the basis of the application's data. They are `Brand`, `Category`, `Rating`, `Listing`, `Loan`, `User` and `Profile`. `User` is referenced by `Profile` via a foreign key - where User `has_one` Profile and  Profile `belongs_to` User. As shown, the `User` class also contains the `devise` functionality. 

```ruby
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile
end

class Profile < ApplicationRecord
  belongs_to :user
  has_many :ratings
  has_one_attached :image
  has_many :listings_to_lend, class_name: "Listing", foreign_key: "lender_id"
  has_many :listings_to_rent, class_name: "Listing", foreign_key: "renter_id"
end

```

The `Profile` class holds a number of relationships to other model classes.  The `Rating` class is referenced via foreign key with a `has_many` ratings (as a user can receive ratings from many users). The `Profile` and `Listing` models incorporate a self-referential association (aka Self-Join) whereby the Profile id is referred to as either the lender_id or the renter_id in order to represent the intended functionality existing between one listing and two users - one as the lender and one as the renter. Each `Listing` `belongs_to` a profile but the `profile.id` is referred to as the `renter_id` (for the user who created the listing) and the lender_id (for the user who rent it). This way, each profile can list many items and can rent many items. Also, when creating a listing only a lender is required which is why in the Listing class, `optional: true` is included after the `:renter` association.

```ruby
class Listing < ApplicationRecord
  has_one :brand
  has_one :category
  #image upload (aws)
  has_one_attached :image
  #self-join setup
  belongs_to :lender, class_name: "Profile"
  belongs_to :renter, class_name: "Profile", optional: true
end
```

The `Brand`, `Category` and `Rating` models are all referenced via foreign key by other models. Each `Rating` is unique and each `Profile` `has_many` ratings. A rating cannot exist without a profile to be rated, so it is assigned a `belongs_to` relationship with `Profile`. The `Listing` class refers to the `Brand` and `Category` models via foreign key. Each listing has_one Brand and Category, whereas each `Brand` and `Category` can be assigned to many `Listings`, so the assigned relationship reflects this.

```ruby
class Brand < ApplicationRecord
    has_many :listings
end

class Category < ApplicationRecord
    has_many :listings
end

class Rating < ApplicationRecord
  belongs_to :profile
end
```

Finally, the `Loan` model references the `Listing` model via foreign key and is assigned a `belongs_to` relationship with listing, as no loan can exist without one. The 

```ruby
class Loan < ApplicationRecord
	belongs_to :listing
end
```

### Discuss the database relations to be implemented.

The database relations (as provided in the ERD below) 

### Provide your database schema design.

![ERD](docs/SynthRent-ERD-latest.png)

### Provide User stories for your App.

#### SignUp/Login

User is greeted by home page, a nav bar with options to sign up/log in, a seach listings feature (not currently working) and grid of currently available listings.  Upon signing up and logging in, user is taken to the profile page or profile setup page (as this is required to create a listing or a loan). Profile allows some personalisation including name, bio, location (postcode) and an image.

#### Listings/Loan

As a User with a Profile, one would now want to create a listing as a lender, or browse the listings index to find a listing to rent. If listings are available a button is shown to 'request to loan'. When that button is clicked, a new loan page appears showing the pre-populated fields of the listing with the option to select the start date and end date. Clicking 'Create Loan'  shows the user the new loan with the the calculated total cost. Success! 

### Wireframes

11 pages for 3 devices (desktop, tablet and mobile) were sketched using Balsamiq. 

 [Link to Wireframes](docs/borrows-wireframes.pdf) 

### Describe the way tasks are planned and tracked in your project

Task management tool `Trello` is utilised to keep track of required tasks throughout the course of the development phase. Tasks were coloured as Red (critical), Orange (medium) and Green (optional) and assigned due dates. Once completed, tasks are moved into the Completed card.

![trello](/docs/trello.png)

### Screenshots

![sc-homepage](docs/sc-homepage.png)

![sc-desktop-sign-in](docs/sc-desktop-sign-in.png)

![sc-create-listing](docs/sc-create-listing.png)

![sc-desktop-new-loan](docs/sc-desktop-new-loan.png)

### 

