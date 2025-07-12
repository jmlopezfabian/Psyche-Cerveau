FROM node:20-bullseye-slim

RUN apt-get update && apt-get install -y python3 python3-pip && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY package.json tailwind.config.js ./
RUN npm install

COPY app/ ./app/

CMD ["bash", "-c", "npm run build-css & python3 app/app.py"]
