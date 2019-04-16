import random
import string
from random import randint
from datetime import datetime
import time

class generator:

    def generate_ic_number(self):
        d = datetime.now()
        dateString = d.strftime('%d%m%Y%H%M%S')
        return dateString

    def generate_admin_name(self):
        return 'robotadmin'+''.join(random.choice(string.lowercase) for i in range(10))

    def generate_project_name(self):
        return 'todoist-'+''.join(random.choice(string.lowercase) for i in range(10))

    def generate_assignment_name_by_time(self, prefix='Assign'):
        return str(prefix) + '-Robot-' + str(time.strftime("%Y-%m-%d-%H-%M-%S"))
