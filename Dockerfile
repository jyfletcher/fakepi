FROM python:alpine3.20
WORKDIR /usr/src/app
RUN pip install cherrypy
COPY ./fakepi ./
ENV BIND_ADDRESS=0.0.0.0
ENV BIND_PORT=8080
EXPOSE 8080/tcp
CMD ["python", "./fakepi"]
