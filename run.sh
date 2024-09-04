podman login -u iamapikey -p $ENTITLEMENT_KEY
podman pull icr.io/zoscp/oeftools:latest
podman run -it --rm --uts host --annotation zoscp.ibm.com/override-networking=host 44e13a0602c9
