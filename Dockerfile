FROM node:21-alpine AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm install yarn
RUN npm run build

FROM nginx:1.21-alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]