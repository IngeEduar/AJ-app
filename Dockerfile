FROM python:3.9

WORKDIR /app

COPY ./index.html index.html

EXPOSE 8000

CMD ["python", "-m", "http.server", "8000"]