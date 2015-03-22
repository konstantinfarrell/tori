from django.shortcuts import render

def ipa(request):
    return render(request, 'ipa/ipa.html', {})
