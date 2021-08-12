# Volt Challenge

## Instructions

Each Volt workout program requires some or all of the following equipment:
band, barbell, bench, box, cable machine, dumbbell, glute-ham, incline bench,
lat pulldown, medicine ball, pullup bar, squat rack, kettlebell, and stability
ball. Some programs are specific to one sport. When an athlete is selecting a
program, they need to be able to indicate which of the above equipment is
available to them and then see a list of the available programs for which the
athlete has all the required equipment. They also need to be able to select a
sport to limit the list to only programs specific to that sport.

We need an API that can receive an http request with the user’s selections of
equipment and a sport if any. The response should contain the list of programs
as an array of objects in the following format:

```
{ 
  id: 15, 
  name: ‘Womens Intermediate Soccer’, 
  sport: { name: ‘Soccer’, id: 29 }, 
  required_equipment: [ 
    { name: ‘Bench’, id: 1}], 
    { name:’Dumbell’, id: 7 }, 
    { name: ‘Barbell’, id: 14}
  ] 
}
```

## Technologies
Project was created with:
* Ruby version 2.7.2
* Rails version 6.1.4
* Postgres 13

## Setup
To run this project, install it locally, and run the server on default port 3000.
```
$ cd volt-challenge

# install dependencies
$ bundle install

# create, migrate, and seed the database
$ bin/rails db:setup

# start the server
$ bin/rails s
```

## Testing

### Automated Test Suite
`$ bin/rails test`

### Interacting with the Programs API
Query the API using a tool like `curl` to send http requests to the server.

### GET /api/v1/programs
Returns all programs
```
curl -X GET \
  -H "Content-type: application/json" \
  -H "Accept: application/json" \
  "http://localhost:3000/api/v1/programs"
```

### GET /api/v1/programs?sport_id=X
Get programs specific to sport ID (1=soccer)
```
curl -X GET \
  -H "Content-type: application/json" \
  -H "Accept: application/json" \
  -d '{"sport_id": 1} \
  "http://localhost:3000/api/v1/programs"
```

### GET /api/v1/programs?equipment=[]
Get possible programs based on available equipment
Note: equipment is randomly assigned to different programs (see [db/seeds.rb](db/seeds.rb))
```
curl -X GET \
  -H "Content-type: application/json" \
  -H "Accept: application/json" \
  -d '{"equipment_ids": [1,2]} \
  "http://localhost:3000/api/v1/programs"
```

### GET /api/v1/programs?sport_id=X&equipment=[]
Get programs based on both sport and available equipment
Note: equipment is randomly assigned to different programs (see [db/seeds.rb](db/seeds.rb))
```
curl -X GET \
  -H "Content-type: application/json" \
  -H "Accept: application/json" \
  -d '{"sport_id": 1, "equipment_ids": [1,2]} \
  "http://localhost:3000/api/v1/programs"
```
