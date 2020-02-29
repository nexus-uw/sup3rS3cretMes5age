FROM 1.14-stretch
EXPOSE 1234

ENV \
    VAULT_ADDR \
    VAULT_TOKEN

RUN \
apk add --no-cache ca-certificates make;\
mkdir -p /opt/supersecret/static

WORKDIR /opt/supersecret

COPY ./*.go .
RUN make run-local VIRTUAL_HOST=secret.test

#todo create separate container from alpine

COPY bin/sup3rs3cretMes5age /opt/supersecret
COPY static /opt/supersecret/static

CMD [ "./sup3rs3cretMes5age" ]
