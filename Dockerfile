FROM node:18.13 as builder
WORKDIR /app
COPY package*.json ./
COPY . .
RUN npm run build

FROM nginx:1.21-alpine
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 3000