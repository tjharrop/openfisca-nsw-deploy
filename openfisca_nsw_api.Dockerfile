FROM python:3.7

COPY . /openfisca_nsw_api

#### Build API ####

WORKDIR /openfisca_nsw_api/openfisca_nsw_API
RUN python -m pip install ../openfisca_nsw_base/
RUN python -m pip install ../openfisca_nsw_rules_kids_vouchers/
RUN python -m pip install ../openfisca_nsw_ess_nabers
RUN python -m pip install ../openfisca_nsw_community_gaming
RUN pip install -e .

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]