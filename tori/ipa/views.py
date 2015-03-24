from django.shortcuts import render
from .models import Character, Vowel, Consonant

def ipa(request):
    characters = Character.objects.all()
    consonants = Consonant.objects.all()
    vowels = Vowel.objects.all()

    uncategorized = Character.objects.all().exclude(name__in=vowels.values('name')).exclude(name__in=consonants.values('name'))

    return render(request, 'ipa/ipa.html', {
        'uncategorized': uncategorized,
        'characters': characters,
        'consonants': consonants,
        'vowels': vowels,
    })

def _list(request):
    characters = Character.objects.all()

    return render(request, 'ipa/list.html', {
        'characters': characters,
    })

def list_vowels(request):
    vowels = Vowel.objects.all()

    return render(request, 'ipa/vowels.html', {
        'vowels': vowels,
    })

def list_consonants(request):
    consonants = Consonant.objects.all()

    return render(request, 'ipa/consonants.html', {
        'consonants': consonants,
    })

def create(request):
    return _edit(request, char_id=None)

def edit(request, char_id):
    return _edit(request, char_id)

def _edit(request, char_id):
    pass
