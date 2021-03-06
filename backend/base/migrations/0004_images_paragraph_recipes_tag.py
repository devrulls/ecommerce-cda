# Generated by Django 3.2 on 2022-05-24 15:08

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('base', '0003_product_image'),
    ]

    operations = [
        migrations.CreateModel(
            name='Images',
            fields=[
                ('name', models.CharField(blank=True, max_length=200, null=True)),
                ('createdAt', models.DateTimeField(auto_now_add=True)),
                ('_id', models.AutoField(editable=False, primary_key=True, serialize=False)),
            ],
        ),
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('name', models.CharField(blank=True, max_length=200, null=True)),
                ('_id', models.AutoField(editable=False, primary_key=True, serialize=False)),
            ],
        ),
        migrations.CreateModel(
            name='Recipes',
            fields=[
                ('rec_difficulty', models.IntegerField(blank=True, default=1, null=True)),
                ('rec_statut', models.IntegerField(blank=True, default=1, null=True)),
                ('rec_duration', models.IntegerField(blank=True, default=0, null=True)),
                ('name', models.CharField(blank=True, max_length=200, null=True)),
                ('createdAt', models.DateTimeField(auto_now_add=True)),
                ('_id', models.AutoField(editable=False, primary_key=True, serialize=False)),
                ('image', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='base.images')),
                ('tag', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='base.tag')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Paragraph',
            fields=[
                ('paragraph_organisation', models.CharField(blank=True, max_length=200, null=True)),
                ('paragraph_content', models.IntegerField(blank=True, default=0, null=True)),
                ('createdAt', models.DateTimeField(auto_now_add=True)),
                ('_id', models.AutoField(editable=False, primary_key=True, serialize=False)),
                ('recipe', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='base.recipes')),
            ],
        ),
    ]
