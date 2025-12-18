FROM node:24-buster AS builder

WORKDIR /app

COPY . .

RUN npm install && npm run build

# ---------------------------------------------------
FROM nginx:alpine AS server

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
