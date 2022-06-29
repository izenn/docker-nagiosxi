FROM centos:7

#Install Pre-reqs and dependencies not automatically installed
RUN yum install epel-release which openssh-server curl -y
#Install Nagios Repo
RUN rpm -Uvh https://repo.nagios.com/nagios/7/nagios-repo-7-4.el7.noarch.rpm
RUN yum update -y
#Fix SystemD for centos7
RUN curl https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl.py -o /usr/bin/systemctl
RUN chmod a+x /usr/bin/systemctl
#Fix shellinabox not executable
RUN yum install nagiosxi-shellinabox -y
RUN chmod a+x /usr/sbin/shellinaboxd
#Install Nagios
RUN yum install nagiosxi -y
#Copy startup script
COPY nagios.sh /root/nagios.sh
RUN chmod a+x /root/nagios.sh
#Copy stop script
COPY stop.sh /root/stop.sh
RUN chmod a+x /root/stop.sh
#Stop installer started services
RUN /root/stop.sh
#Clean up
RUN yum clean all

EXPOSE 80 443 5666 5667

CMD ["/root/nagios.sh"]

