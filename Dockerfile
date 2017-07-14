FROM m0kimura/ubuntu-base

ARG user=${user:-docker}
RUN apt-get update \


##  PYTHON

&&  apt-get install -y \
      python-dev \
      python-numpy \
      python-opencv \
&&  cd /root \
&&  wget https://bootstrap.pypa.io/get-pip.py \
&&  chmod +x get-pip.py \
&&  ./get-pip.py \
&&  pip install requests \
&&  pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.7.1-cp27-none-linux_x86_64.whl \
&&  rm get-pip.py \
##

## VSCODE
&&  apt-get install -y libgtk2.0-0 libgconf2-4 \
      libnss3 libasound2 libxtst6 libcanberra-gtk-module libgl1-mesa-glx libnotify4 libxkbfile1 libxss1 \
&&  cd /root \
&&  wget https://packages.microsoft.com/repos/vscode/pool/main/c/code/code_1.12.2-1494422229_amd64.deb \
&&  dpkg -i code_1.12.2-1494422229_amd64.deb \
&&  rm code_1.12.2-1494422229_amd64.deb \
##

&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/*


##  USER
ENV HOME=/home/${user} USER=${user}
WORKDIR $HOME
USER $USER
##

COPY ./starter.sh /root/starter.sh
CMD /root/starter.sh
