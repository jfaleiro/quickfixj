# syntax = devthefuture/dockerfile-x
# support for include - see https://github.com/moby/moby/issues/735#issuecomment-1703847889
FROM jfaleiro/sdkman:v0.1.0

# Install JAVA
# Eclipse Temurin is the name of the OpenJDK distribution from Adoptium - Formerly AdoptOpenJDK∏
RUN . "$SDKMAN_DIR/bin/sdkman-init.sh" \
    && sdk install java 17.0.10-amzn

# Install MAVEN
RUN . "$SDKMAN_DIR/bin/sdkman-init.sh" \
    && sdk install maven

# Install gradle
RUN . "$SDKMAN_DIR/bin/sdkman-init.sh" \
    && sdk install gradle

# INCLUDE https://github.com/jfaleiro/container-devcli/blob/v0.1.5/Dockerfile
INCLUDE devcli.Dockerfile
