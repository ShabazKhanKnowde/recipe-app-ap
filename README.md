# recipe-app-ap
docker login  -u shabazknowde
docker-compose run --rm app sh -c "python manage.py test"


docker-compose build
docker-compose run --rm app sh -c "cd app; python manage.py startapp core"
docker-compose up
git push origin
git commit -am "Added Postgresql."

docker build .
docker-compose build
docker-compose up
docker-compose down
docker-compose run --rm app sh -c "cd app; flake8"
docker-compose run --rm app sh -c "cd app; django-admin startproject core ."
docker-compose run --rm app sh -c "cd app; python manage.py wait_for_db && python manage.py migrate"
docker volume rm recipe-app-api_dev-db-data  # remove db
docker volume ls