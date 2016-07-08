# ol

## Instructions for running

### Setting Up the application

```
bundle install
rake db:migrate
rake db:seed
```

seeding may take a few minutes

### Running the Application

```
ruby app.rb
```

### Consuming the api endpoints

#### Requesting an Authorization Token

```
curl -i http://localhost:4567/gettoken
```

#### Request a list of businesses (default is the first page)

##### Parameters

```
page (default is 1)
per_page (default is 50)
```

```
curl -i -H 'Authorization: bb3p3dwhuoDSkPxGLpD_TJu6lMGzJCgAj50vEZEgJMvWeFIEvq4lBM5lqfEmOVb6rOXmN2kEibln3j1UQ' http://localhost:4567/businesses
curl -i -H 'Authorization: bb3p3dwhuoDSkPxGLpD_TJu6lMGzJCgAj50vEZEgJMvWeFIEvq4lBM5lqfEmOVb6rOXmN2kEibln3j1UQ' http://localhost:4567/businesses?page=3
curl -i -H 'Authorization: bb3p3dwhuoDSkPxGLpD_TJu6lMGzJCgAj50vEZEgJMvWeFIEvq4lBM5lqfEmOVb6rOXmN2kEibln3j1UQ'http://localhost:4567/businesses?page=3&per_page=100
```

#### Request a business by id

```
curl -i -H 'Authorization: bb3p3dwhuoDSkPxGLpD_TJu6lMGzJCgAj50vEZEgJMvWeFIEvq4lBM5lqfEmOVb6rOXmN2kEibln3j1UQ' http://localhost:4567/businesses/1
curl -i -H 'Authorization: bb3p3dwhuoDSkPxGLpD_TJu6lMGzJCgAj50vEZEgJMvWeFIEvq4lBM5lqfEmOVb6rOXmN2kEibln3j1UQ' http://localhost:4567/businesses/49999
```
