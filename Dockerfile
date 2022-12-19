FROM node:latest
FROM mvn:latest

WORKDIR /app

#RUN apt-get update && apt-get install -y maven

COPY pom.xml ./
RUN mvn compile
RUN mvn package

COPY package*.json ./
RUN pnpm install

COPY . .

RUN pnpm build
RUN pnpm start

ENV PORT=8080
EXPOSE 8080

CMD ["java", "-jar", "target/scholarizer.jar"]