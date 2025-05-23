# Generated by Django 5.1.5 on 2025-01-29 14:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('medical1', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Doctor',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(max_length=100)),
                ('last_name', models.CharField(max_length=100)),
                ('gender', models.CharField(choices=[('Homme', 'Homme'), ('Femme', 'Femme')], max_length=10)),
                ('birth_date', models.DateField()),
                ('phone', models.CharField(max_length=15)),
                ('email', models.EmailField(max_length=254, unique=True)),
                ('location', models.CharField(max_length=100)),
                ('specialty', models.CharField(choices=[('Développeur', 'Développeur'), ('Designer', 'Designer'), ('Manager', 'Manager')], max_length=50)),
                ('password', models.CharField(max_length=100)),
            ],
        ),
        migrations.DeleteModel(
            name='Item',
        ),
    ]
