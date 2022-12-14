FROM node:latest
FROM mvn:latest

WORKDIR /app

#RUN apt-get update && apt-get install -y maven

COPY pom.xml ./
RUN mvn dependency:go-offline

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build

ENV PORT=8080
EXPOSE 8080

CMD ["mvn", "spring-boot:run"]