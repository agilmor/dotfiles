FROM ubuntu:22.04

# Arguments
ARG user=agil
ARG uid=1000
ARG gid=1000

#
# Configure apt-get
#

# Enable src packages for build-dep
RUN sed -i -- 's/#deb-src/deb-src/g'  /etc/apt/sources.list && \
    sed -i -- 's/# deb-src/deb-src/g' /etc/apt/sources.list
RUN apt-get update

# Avoid minimized image
RUN yes | unminimize

#
# Basic admin packages
#
RUN apt-get install -y \
	apt-utils \
	bash-completion \
	git \
	locales-all \
    rsync \
	sudo \
	vim-tiny

#
# Setup root
#
RUN echo "source ~/.bashrc_generic >> ~/.bashrc " && \
	ln -s /home/$user/.inputrc ~/ && \
	ln -s /home/$user/usr* ~/ && \
	ln -s /home/$user/workspace ~/

#
# Add local/arg user as sudoer
#
RUN addgroup --gid $gid $user && \
    adduser  --gid $gid --uid $uid --shell /bin/bash --disabled-password $user && \
    adduser $user sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER $user
WORKDIR /home/$user
ENV DOCKER $user
ENV USER   $user

#
# Generic development environment (tmux+vim)
#
# RUN sudo DEBIAN_FRONTEND=noninteractive apt-get -y build-dep \
#     vim-gtk

RUN sudo apt-get -y install \
	automake \
	bear \
	build-essential \
	cmake \
	cscope \
	gcc \
	g++ \
    make \
    scons

RUN sudo apt-get -y install \
	libtinfo5 \
	tmuxinator \
    xclip

RUN sudo apt-get -y install \
	libatk1.0-dev \
	libcairo2-dev \
	libevent-dev \
	libgtk2.0-dev \
    libncurses5-dev \
    libpango1.0-dev \
    libx11-dev \
    libxpm-dev \
    libxt-dev \
	python3-dev


#
# Slurm dev
#
RUN sudo mkdir   /mnt/host
RUN sudo apt-get install -y munge mariadb-server mariadb-client                         # Needed for running
RUN sudo apt-get install -y libmunge-dev libmariadb-dev libssl-dev                      # Needed for building
RUN sudo DEBIAN_FRONTEND=noninteractive \
    apt-get install -y libswitch-perl expect                                            # Needed for testing
RUN sudo apt-get install -y libhwloc-dev                                                # Needed for hwloc
RUN sudo apt-get install -y libjwt-dev libyaml-dev libjson-c-dev libhttp-parser-dev     # Needed for slurmrestd
RUN sudo apt-get install -y libhdf5-serial-dev hdf5-helpers                             # Needed for acct_gather_profile/hdf5 (test12.6)
RUN sudo apt-get install -y flex libevent-dev                                           # Needed for PMI
# RUN sudo apt-get install -y nvidia-cuda-dev                                             # Needed for NVML (400G?)
RUN sudo apt-get install -y python3-pytest                                             # Needed for testsuite/python
RUN sudo apt-get install -y python3-regex \
                            python3-typing-extensions \
                            python3-frozendict \
                            python3-requests \
                            python3-dateutil \
                            default-jre                                                # Needed for restd/openapi tests

#
# Setup the DB
#
# RUN sudo /etc/init.d/mysql start && \
#     echo "CREATE USER 'slurm'@'localhost' IDENTIFIED BY 'slurmpwd';"             | sudo mysql -u root && \
#     echo "GRANT ALL PRIVILEGES ON *.* TO 'slurm'@'localhost' WITH GRANT OPTION;" | sudo mysql -u root

CMD /bin/bash
