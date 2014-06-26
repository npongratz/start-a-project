# helloworld.py

# Let's get this party started
import falcon
import json

# Falcon follows the REST architectural style, meaning (among
# other things) that you think in terms of resources and state
# transitions, which map to HTTP verbs.
class HelloWorldResource:
    def on_get(self, req, resp):
        """Handles GET requests"""
        resp.status = falcon.HTTP_200  # This is the default status
        resp.body = ('\nHello World!!')

# falcon.API instances are callable WSGI apps
app = falcon.API()

# Resources are represented by long-lived class instances
hello = HelloWorldResource()

# things will handle all requests to the '/things' URL path
app.add_route('/hello', hello)