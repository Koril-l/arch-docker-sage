FROM archlinux:latest

RUN      echo 'root:root' | chpasswd
RUN	 pacman -Syu --noconfirm
RUN 	 pacman -Sy reflector --noconfirm
RUN 	 reflector --verbose --sort rate -l 20 --save /etc/pacman.d/mirrorlist
RUN	 pacman -Sy --noconfirm openssh python3 python-pip sagemath cython gcc python-plotly jupyter-notebook python-jupyter-server-terminals


RUN  /usr/bin/ssh-keygen -A
RUN  echo 'UsePAM no' >> /etc/ssh/ssh_config
RUN  echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN  echo 'AuthenticationMethods password' >> /etc/ssh/sshd_config 
RUN  echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

EXPOSE	 22
EXPOSE   8888

RUN jupyter lab --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.token='' --port 8888
CMD	 ["/usr/sbin/sshd", "-D"]
