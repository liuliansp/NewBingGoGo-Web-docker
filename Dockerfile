FROM gradle:jdk17-alpine
RUN apk update
RUN apk add git openssh
WORKDIR /clone-workspace
RUN git clone https://github.com/jianjianai/NewBingGoGo-Web NewBingGoGo-Web

WORKDIR /clone-workspace/NewBingGoGo-Web
RUN gradle shadow

WORKDIR /
RUN mv -f /clone-workspace/NewBingGoGo-Web/build/libs/NewBingGoGo-web-1.0-SNAPSHOT-all.jar /run.jar
RUN rm -rf /clone-workspace
ADD /Cookies.yml /Cookies.yml
EXPOSE 80
ENV PORT=80
CMD sh -c  "java -jar /run.jar \$PORT"
