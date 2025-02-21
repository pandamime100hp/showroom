FROM python:3.12-slim-bullseye



WORKDIR /app
COPY ./accounts /app


EXPOSE 8000

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]