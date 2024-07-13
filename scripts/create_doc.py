import json
from server import app

openapi_data = app.openapi()
with open("docs/endpoints/swagger.json", "w") as file:
    string = json.dumps(openapi_data, indent=2)
    file.write(string)
