import os
from googleapiclient import discovery
from googleapiclient.errors import HttpError
from oauth2client.client import GoogleCredentials

def stop_instance(request):
    project = os.getenv('GCP_PROJECT')
    zone = 'us-central1-a' # replace this with the appropriate zone
    instance = 'instance-1' # replace this with your instance name

    credentials = GoogleCredentials.get_application_default()
    service = discovery.build('compute', 'v1', credentials=credentials)
    request = service.instances().stop(project=project, zone=zone, instance=instance)
    try:
        response = request.execute()
        return f'Successfully stopped instance {instance}'
    except HttpError as e:
        print(f'Could not stop instance {instance}. Error: {e}')
        return f'Error stopping instance {instance}. Check Logs.', 500
