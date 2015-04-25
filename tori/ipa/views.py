from django.shortcuts import render
from .models import Character, Vowel, Consonant

def ipa(request):
    # English stuff
    english = Character.objects.filter(english=True)
    english_vowel = english.filter(pk__in=Vowel.objects.values('char_id'))
    english_consonant = english.filter(pk__in=Consonant.objects.values('char_id'))
    # International stuff
    international = Character.objects.filter(english=False)
    international_vowel = international.filter(pk__in=Vowel.objects.values('char_id'))
    international_consonant = international.filter(pk__in=Consonant.objects.values('char_id'))

    uncategorized_english = english.\
            exclude(pk__in=english_vowel.values('char_id')).\
            exclude(pk__in=english_consonant.values('char_id'))

    uncategorized_international = international.\
            exclude(pk__in=international_vowel.values('char_id')).\
            exclude(pk__in=international_consonant.values('char_id'))

    # Generate a list of characters & keybindings
    english_keybindings = english.values('key_binding','code').exclude(key_binding=None)

    return render(request, 'ipa/ipa.html', {
        'english_keybindings': english_keybindings,
        'uncategorized_english': uncategorized_english,
        'english': english,
        'english_vowel': english_vowel,
        'english_consonant': english_consonant,
        'uncategorized_international': uncategorized_english,
        'international': international,
        'international_vowel': international_vowel,
        'international_consonant': international_consonant,
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
