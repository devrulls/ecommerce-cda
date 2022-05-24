from django.contrib.auth.models import User
from django.db.models.signals import pre_save


def updateUser(sender, instance, **kwargs):
    print('Signals Triggered')
    user = instance
    if user.email is not "":
        user.username = user.email


pre_save.connect(updateUser, sender=User)
