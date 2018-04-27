import os
import logging

SECRET_KEY = os.environ.get('SECRET_KEY')
SQL_ALCHEMY_DATABASE_URI = os.environ.get('DB_CONNECT_STRING', 'sqlite:////data/privacyidea.db')
PI_ENCFILE = os.environ.get("PI_ENCFILE", "/data/encfile")
PI_HSM = os.environ.get("PI_HSM", "default")
PI_AUDIT_MODULE = os.environ.get("PI_AUDIT_MODULE", "privacyidea.lib.auditmodules.sqlaudit")
PI_AUDIT_KEY_PRIVATE = os.environ.get("PI_AUDIT_KEY_PRIVATE", "/data/keys/private.pem")
PI_AUDIT_KEY_PUBLIC = os.environ.get("PI_AUDIT_KEY_PUBLIC", "/data/keys/public.pem")
PI_LOGFILE = os.environ.get("PI_LOGFILE", "/data/privacyidea.log")
PI_LOGLEVEL = logging.getLevelName(os.environ.get("PI_LOGLEVEL", "INFO"))
CACHE_TYPE = os.environ.get("CACHE_TYPE", "simple")
PI_EXTERNAL_LINKS = os.environ.get("PI_EXTERNAL_LINKS", "True").lower() == "true"
# PI_GNUPG_HOME = "gpg"
# PI_LOGO = "otherlogo.png"
# PI_AUDIT_SQL_URI = sqlite://
PI_VASCO_LIBRARY = None
