FROM gcc:8.2
RUN apt update -y && apt-get install -y wget
RUN apt install -y openmpi-doc openmpi-bin libopenmpi-dev
RUN apt install -y x11-apps
RUN apt install -y vim
RUN sh -c "mkdir -p /usr/opt && cd /usr/opt \
  && curl -s -L https://github.com/Kitware/CMake/releases/download/v3.19.2/cmake-3.19.2-Linux-x86_64.sh -o cmake.sh \
  && sh cmake.sh --skip-license --prefix=/usr/local"
ARG DOCKER_UID=1000
ARG DOCKER_USER=user
ARG DOCKER_PASSWORD=pass
RUN useradd -m --uid ${DOCKER_UID} --groups root ${DOCKER_USER} \
  && echo ${DOCKER_USER}:{DOCKER_PASSWORD} | chpasswd
USER ${DOCKER_USER}
WORKDIR /home/${DOCKER_USER}
RUN sh -c "curl -L https://github.com/sparta/sparta/archive/master.tar.gz \
  | tar xz -C /home/user"
# RUN sh -c "curl -L https://sourceforge.net/projects/sparta/files/sparta-22Jun18.tar.gz/download \
#  | tar xz -C /home/user"
RUN sh -c "ln -s /home/sparta/ ."