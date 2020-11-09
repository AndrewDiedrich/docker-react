FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# must expose port for AWS elastic beanstalk
EXPOSE 80
# from a different phase(phase 0) 
# what do you want to copy 
# and where do you want to copy it to
COPY --from=0 /app/build /usr/share/nginx/html