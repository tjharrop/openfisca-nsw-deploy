FROM python:3.7

COPY . /openfisca_nsw_api

#### Build API ####

WORKDIR /openfisca_nsw_api/openfisca_nsw_API
RUN python -m pip install ../openfisca_nsw_base/
RUN python -m pip install ../openfisca_nsw_rules_kids_vouchers/ 
RUN python -m pip install ../openfisca_nsw_ess_nabers
RUN python -m pip install ../openfisca_nsw_community_gaming
RUN pip install -e .

ENTRYPOINT ["/usr/local/bin/openfisca", "serve", "--workers=3", "--country-package", "openfisca_nsw_base", "--extensions", "openfisca_nsw_ess_nabers", "openfisca_nsw_rules_kids_vouchers", "openfisca_nsw_community_gaming", "openfisca_nsw_API", "--bind", "0.0.0.0:80"]
