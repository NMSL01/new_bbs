from ckeditor_uploader.fields import RichTextUploadingField
from django.forms import forms


class comment_write(forms.Form):

    content = RichTextUploadingField(verbose_name='正文')
