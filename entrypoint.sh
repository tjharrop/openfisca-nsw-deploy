#!/bin/bash

/usr/local/bin/openfisca serve --workers=3 --country-package openfisca_nsw_base --extensions openfisca_nsw_ess_nabers openfisca_nsw_rules_kids_vouchers openfisca_nsw_community_gaming openfisca_nsw_API --bind 0.0.0.0:$PORT
