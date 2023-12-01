# FROM -> 어떤 가상 환경에서 실행을 할 것인가 선택 / 정해진 jdk가 존재
# ARG -> 변수 / 대문자(스네이크)로 표기 TEST_NAME=test
# CMD -> 도커 환경에서 명령어를 실행 할 수 있음(한번만 가능)
# COPY -> TEST_NAME aaa (as 처럼 사용)
# ENTRYPOINT ["java", "-Dspring.profiles.active=prod1", "-Dserver.env=green" ,"-jar", "파일명.jar"] (띄어쓰기로 합쳐짐?)
# alpine: 경량화된 jdk

FROM amazoncorretto:11-alpine-jdk
ARG JAR_FILE=target/*.jar
ARG PROFILES
ARG ENV
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-Dspring.profiles.active=${PROFILES}", "-Dserver.env=${ENV}", "-jar", "app.jar"]

# 프로젝트 세팅 끝