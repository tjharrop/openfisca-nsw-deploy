FROM python:3.7

COPY . /openfisca_nsw_api


#### Build extensions ####

WORKDIR /openfisca_nsw_api/openfisca_nsw_base
RUN python setup.py install

WORKDIR /openfisca_nsw_api/openfisca_nsw_rules_kids_vouchers
RUN python setup.py install

WORKDIR /openfisca_nsw_api/openfisca_nsw_ess_nabers
RUN python setup.py install

WORKDIR /openfisca_nsw_api/openfisca_nsw_community_gaming
RUN python setup.py install


#### Build API ####

WORKDIR /openfisca_nsw_api/openfisca_nsw_API
RUN python setup.py install

ENTRYPOINT ["/usr/local/bin/openfisca", "serve", "--workers=3", "--country-package", "openfisca_nsw_base", "--extensions", "openfisca_nsw_ess_nabers", "openfisca_nsw_rules_kids_vouchers", "openfisca_nsw_community_gaming", "openfisca_nsw_API", "--bind", "0.0.0.0:80"]
