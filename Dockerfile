# we use the dockerfile to specify the operating system 
# the python version
# the requirements and so on

# this is my python version for this project
FROM python:3.11.1 

# this is where the code will be stored for the container
WORKDIR /code

# here we are trying to copy the requirements.txt file we have locally into the containers code directory we created
COPY ./requirements.txt /code/requirements.txt

# we install the requirements stored in the working directory requirements.txt
RUN pip install --no-cache-dir -r /code/requirements.txt

# After copying and installing the requirements next is to copy the api code and the joblib file into the docker container

# <from local directory> to <container workingdirectory>
COPY ./app /code/app

# for interacting with the api we need to expose an endpoint/port
EXPOSE 8080

# give the command the docker container should run 
# the app.main:app means go into the app folder then into the main.py folder and 
# run the FastAPI stored in the variable called app
# look at the png file called Explanationofappmainapp.png for a visual explanation

# the --host is 0.0.0.0 which would be connected to https and the port 

# the --port is 8000 which is the port we exposed above

# final output for accessing the api would be 
# http://0.0.0.0:8000/predict/
CMD [ "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]