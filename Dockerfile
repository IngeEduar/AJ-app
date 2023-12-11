FROM python:3.9

WORKDIR /app

RUN echo "Hola mundo" > index.html

EXPOSE 8000

CMD ["python", "-m", "http.server", "8000"]