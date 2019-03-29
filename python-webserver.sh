#!/usr/bin/python3 -u

import http.server
import socketserver
import os
import sys

PORT = 8080

def start():
        web_dir = os.path.join(os.path.dirname(__file__), '/var/www/public_html')
        os.chdir(web_dir)

        logging.info("Attemping to start webserver on port "+str(PORT))

        Handler = http.server.SimpleHTTPRequestHandler
        try:
                httpd = socketserver.TCPServer(("", PORT), Handler)
                logging.info("Webserver started!")
        except:
                print("\ncannot start webserver!  Check that process ins't already running on port", PORT,"\n")
                logging.critical("CANNOT START WEBSERVER ON PORT "+str(PORT))
                sys.exit()

        print("\n**********************\nserving at port: ", PORT,"\n**********************\n")

        while True:
            httpd.handle_request()

if __name__ == "__main__":
        import logging
        logging.basicConfig(format='%(asctime)s | %(name)s | %(levelname)s | %(message)s', filename='/var/www/logs/python-webserver.log', level=logging.INFO, filemode='a')
        logger = logging.getLogger(__name__)
        start()
