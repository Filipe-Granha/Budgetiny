# Budgetiny

RESTful Web app, CodeClan's 1st individual project.</br>
A budget planner, able to perform CRUD functions, and display the data to the user, allowing to have a better control on expenses, and where they're occurring.</br>

### Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Have PostgreSQL, Ruby and Sinatra installed on your machine.</br>
Download files from this repo.</br>

### Deployment

1) postgres -D /usr/local/var/postgres (In the terminal home directory)</br>
2) psql -d budget -f db/budget.sql (Drops and Creates the Tables, inside the /db directory)</br>
3) ruby seeds.rb (we should be inside the /db directory, or use  ruby db/seeds.rb)</br>
4) ruby app.rb</br>
5) browser: localhost:4567</br>
6) control \ (closes sinatra connection)</br>

### Built With

Ruby</br>
Sinatra</br>
PostgreSQL</br>
HTML</br>
CSS</br>

### Authors

Carlos Filipe

### Acknowledgments

All at CodeClan, instructors, staff and students alike, a big thank you for all your help and support!
