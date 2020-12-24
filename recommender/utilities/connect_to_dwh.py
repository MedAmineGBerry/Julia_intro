"""
This module is about connecting to the dwh
"""
import os
import psycopg2


class PSQL(object):
    """
    This is the class of the Postgresql connector
    """
    os.environ["PSQL_HOSTNAME"] = "172.31.27.255"
    os.environ["PSQL_DATABASE"] = "warehouse"
    os.environ["PSQL_PORT"] = "5439"
    os.environ["PSQL_USER"] = "amine"
    os.environ["PSQL_PASS"] = "7V1tk<Cbx;Bd^PS5;*fD"
    host = os.getenv("PSQL_HOSTNAME")
    dbname = os.getenv("PSQL_DATABASE")
    port = os.getenv("PSQL_PORT")
    user = os.getenv("PSQL_USER")
    password = os.getenv("PSQL_PASS")

    def __init__(self):
        if any(v is None for v in [
            self.dbname, self.host,
            self.password, self.port,
                self.user]):
            raise Exception("Please add your environment variables")

    def connect(self):
        """
        This method is the connection to the dwh
        """
        return psycopg2.connect(
            dbname=self.dbname,
            host=self.host,
            port=self.port,
            user=self.user,
            password=self.password
        )
