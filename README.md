# docker-nagiosxi
### Docker image for Nagios XI using Centos 7 and the Nagios XI RPM repositories 
###### inspired by [tgoetheyn's](https://github.com/tgoetheyn) docker image

to start
> docker run -d -p 80:80 -p 443:443 -p 5666:5666 -p 5667:5667 --name nagiosxi localhost/nagiosxi

to stop
> docker stop -t 30 nagiosxi

The -t is important because it allows the services in the container to gracefully stop which takes longer than 10 seconds.  you may need to adjust it based on your system speed

HTTPS is available, however, you should generate new certs.  you can bind mount your certs into the image.

Certificate files are located in the following locations:
> SSLCertificateFile /etc/pki/tls/certs/localhost.crt
>
> SSLCertificateKeyFile /etc/pki/tls/private/localhost.key

to access:
> http://YOUR_IP/nagiosxi/

On first start you will be prompted with the Nagios XI startup wizard

For licensing, use the free/limited (7 host/100 service check) license
