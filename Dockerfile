FROM ansibleplaybookbundle/apb-base
# MAINTAINER {{ $MAINTAINER }}

LABEL "com.redhat.apb.version"="0.1.0"
LABEL "com.redhat.apb.spec"=\
"aWQ6IDY0Mjk3ZTg4LTY1N2MtNDZhYi1iYjUwLTJhZjdmODRlNWVjNgpuYW1lOiBweXppcC1kZW1v\
LWRiLWFwYgppbWFnZTogYW5zaWJsZXBsYXlib29rYnVuZGxlL3B5emlwLWRlbW8tZGItYXBiCmRl\
c2NyaXB0aW9uOiBQeXRob24gWmlwIERlbW8gRGF0YWJhc2UgQVBCIEltcGxlbWVudGF0aW9uCmJp\
bmRhYmxlOiBUcnVlCmFzeW5jOiBvcHRpb25hbAptZXRhZGF0YTogCiAgZG9jdW1lbnRhdGlvblVy\
bDogaHR0cHM6Ly9naXRodWIuY29tL2Z1c29yL2FwYi1leGFtcGxlcy90cmVlL21hc3Rlci9weXpp\
cC1kZW1vLWRiLWFwYgogIGRlcGVuZGVuY2llczogWydkb2NrZXIuaW8vZmFiaWFudmYvcG9zdGdy\
ZXNxbDpwb3N0Z2lzJ10KICBkaXNwbGF5TmFtZTogUHl6aXAgRGVtbyBEYXRhYmFzZSAoQVBCKQog\
IGxvbmdEZXNjcmlwdGlvbjogQSBkYXRhYmFzZSB3aXRoIEdJUyBzdXBwb3J0IGFuZCBzZWVkZWQg\
ZGF0YSBmb3IgYSBkZW1vbnN0cmF0aW9uIHB5dGhvbiB3ZWJhcHAsIGh0dHBzOi8vZ2l0aHViLmNv\
bS9mdXNvci9weS16aXAtZGVtbwogIApwYXJhbWV0ZXJzOiAKICAtIGRhdGFiYXNlX25hbWU6CiAg\
ICAgIGRlZmF1bHQ6IGFkbWluCiAgICAgIHR5cGU6IHN0cmluZwogICAgICB0aXRsZTogRGF0YWJh\
c2UgTmFtZQogICAgICAKICAtIGRhdGFiYXNlX3Bhc3N3b3JkOgogICAgICBkZWZhdWx0OiBhZG1p\
bgogICAgICB0eXBlOiBzdHJpbmcKICAgICAgZGVzY3JpcHRpb246IEEgcmFuZG9tIGFscGhhbnVt\
ZXJpYyBzdHJpbmcgaWYgbGVmdCBibGFuawogICAgICB0aXRsZTogRGF0YWJhc2UgUGFzc3dvcmQK\
ICAgICAgCiAgLSBkYXRhYmFzZV91c2VyOgogICAgICBkZWZhdWx0OiBhZG1pbgogICAgICB0aXRs\
ZTogRGF0YWJhc2UgVXNlcgogICAgICB0eXBlOiBzdHJpbmcKICAgICAgbWF4bGVuZ3RoOiA2Mwog\
ICAgICAKICAKcmVxdWlyZWQ6IAogIC0gZGF0YWJhc2VfbmFtZQogIC0gZGF0YWJhc2VfdXNlcgog\
IAo="

COPY roles /opt/ansible/roles
COPY playbooks /opt/apb/actions
RUN chown -R apb /opt/{ansible,apb} \
    && chmod -R g=u /opt/{ansible,apb}

RUN yum install -y postgresql && yum clean all

USER apb
