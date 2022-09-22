# Build context. Hämta Linux + Node
FROM node:lts-alpine

# Skapa en mapp "app" inuti Docker image
# /app blir aktuell mapp (när man skriver . senare i filen)
WORKDIR /app

# Installera webbservern vi ska använda i sista steget
# Man KAN använda CMD ["npm", "run", "dev"] i stället, men den startar den lokala utvecklingsservern. Utvecklingsservern är gjord för att felsöka, inte för att köra "production".
RUN npm install -g http-server

# Kopiera package.json -> in till mappen "app" i image
#COPY package.json package-lock.json ./
COPY package*.json ./

# Installera npm-paket
RUN npm install

# Kopiera över all koden från aktuell mapp på datorn -> till /app i image
# Man kan göra det före "RUN npm install" men då kan inte Docker cacha filer och det blir mindre effektivt
COPY . .

# Bygg projektet - kör byggskriptet
# Statiska filer (HTML, CSS, JS) hamnar i /app/dist
RUN npm run build

# Gör port 8080 synlig utåt
EXPOSE 8080

# Starta en webbserver som servar de statiska filerna i /app/dist
# alternativ server: Nginx
# CMD körs när man startar containern
CMD ["http-server", "dist", "-p", "8080"]

