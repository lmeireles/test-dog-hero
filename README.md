# README

The project is using ruby 2.5.1 

Before start make sure the machine has a mysql installed and the service is running.

To run the application first execute, from the projects's root folder:

``bundle install``

``rails db:create``

``rails db:migrate``

Execute the seed to get some Pets (5)

``rails db:seed``

Now just start the server

``rails s``

## Some examples

- Creating a walk
````
POST to /dog_walkings

with json body:
{
	"duration": 60,
	"lat": "24.00000000",
	"lng": "21.23333300",
	"scheduled_to": "2018-05-29",
	"pet_ids": [1, 3, 4] 
}
````

- Listing all walks filtering just the next ones and using the page method to get the second page
````
GET to /dog_walkings?only_next=true&page=2
````

- Starting the walk with id 3
````
POST to /dog_walkings/start_walk/3
````

- Finishing the walk with id 3
````
POST to /dog_walkings/finish_walk/3
````

- Show the walk with id 3
````
GET to /dog_walkings/3
````