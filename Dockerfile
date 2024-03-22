FROM node:18.13 as builder
WORKDIR /app
COPY package*.json ./
COPY . .
RUN npm install
RUN npm run build

FROM nginx:1.21-alpine
COPY --from=builder /app/dist /usr/share/nginx/html
ENV NODE_ENV production
ENV PORT 3000
EXPOSE 3000
