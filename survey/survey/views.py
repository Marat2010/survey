from django.http import HttpResponse
from django.shortcuts import redirect


def redirect_to(request):
    return redirect('api/v1/doc/')                   # ответ: 302 - по умолч. False
    # return redirect('api/v1/')                   # ответ: 302 - по умолч. False


# ------------------------------------------------------
    # return redirect('chats_list_url', permanent=True) # ответ: 301 -не ставить True (сложно убрать)
