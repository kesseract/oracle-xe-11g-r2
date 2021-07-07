FROM wnameless/oracle-xe-11g-r2

#COPY initOFAC.sql /app/initOFAC.sql

ENV ORACLE_HOME /u01/app/oracle/product/11.2.0/xe
ENV ORACLE_SID XE

RUN sed -i -E "s/HOST = [^)]+/HOST = 0.0.0.0/g" /u01/app/oracle/product/11.2.0/xe/network/admin/listener.ora && service oracle-xe start && su -m oracle -c "$ORACLE_HOME/bin/sqlplus '/ as sysdba' @/app/initOFAC.sql"

CMD usermod -G root oracle; service oracle-xe start; /usr/sbin/sshd -d
