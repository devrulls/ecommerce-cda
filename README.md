# Internship project - NESTI- ecommerce

The Nesti site presents recipe ideas to sell its products

## Frontend - React
In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.


## Backend - Django="3.2"

### Environnement virtuel python Pipenv
 - `pipenv shell`
Creating a virtualenv for this project
 - `pipenv install`
Install a local setup.py into your virtual environment/Pipfile:


### `py .\manage.py runserver`

Runs the app in the development mode.\
Open [http://localhost:8000](http://localhost:8000) to view it in your browser.

### Routes api/
Open [http://localhost:8000/api](http://localhost:8000/api) to view it in your browser.

        '/api/products/',
        '/api/products/create',

        '/api/products/upload',

        '/api/products/<id>/reviews/',

        '/api/products/top/',
        '/api/products/<id>/',

        '/api/products/delete/<id>/',
        '/api/products/<update>/<id>/',

