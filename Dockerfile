FROM debian:latest
RUN apt-get update && apt-get install -y g++ cmake make libssl-dev libcrypto++-dev libuWS-dev build-essential && apt-get clean
WORKDIR /app
COPY . .
RUN g++ -std=c++17 -o chat_server main.cpp storage.cpp encryption.cpp websocket_server.cpp -luWS -lssl -lcrypto -lpthread
EXPOSE 9001
CMD ["./chat_server"]