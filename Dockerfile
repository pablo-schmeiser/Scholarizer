FROM node:19.2

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY pom.xml ./
RUN mvn dependency:go-offline

COPY . .

ENV PORT=8080
EXPOSE 8080

CMD ["npm", "start"]
CMD ["mvn", "spring-boot:run"]