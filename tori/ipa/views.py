from django.shortcuts import render
from .models import Character

def ipa(request):
    characters = Character.objects.all()
    return render(request, 'ipa/ipa.html', {
        'characters': characters,
    })

def create(request):
    return _edit(request, char_id=None)

def edit(request, char_id):
    return _edit(request, char_id)

def _edit(request, char_id):
    pass
