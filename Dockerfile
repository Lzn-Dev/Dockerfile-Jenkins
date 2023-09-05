FROM openjdk:11
LABEL maintainer="Matthieu Lozano" \
      society="Cefim"
      
# Crée un utilisateur 
ARG JENKINS_USER=jenkins
RUN useradd -m -d /srv/jenkins ${JENKINS_USER}
RUN mkdir /src && chown "${JENKINS_USER}" /src
WORKDIR /srv/jenkins

# Rend le repertoire /srv/jenkins persistant
VOLUME ["/srv/jenkins"]

# Précise au container de se lancer sur le port 8080
EXPOSE 8080

# Télécharge le fichier 
RUN wget -O /src/jenkins.war https://get.jenkins.io/war-stable/latest/jenkins.war

# Change l'utilisateur
USER ${JENKINS_USER}

# Commande pour lancer Jenkins
CMD ["java", "-jar", "/src/jenkins.war"]



