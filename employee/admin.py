from django.contrib import admin

# Register your models here.
from .models import Employee
admin.site.register(Employee)

class EmployeeAdmin(admin.ModelAdmin):
    list_display = ('eid', 'ename', 'eemail', 'econtact')
    list_filter = ('eid', 'econtact')  
    search_fields = ('ename', 'eemail')  
    date_hierarchy = 'join_date'
    class Meta:
        verbose_name = 'Custom Employee Name'
        verbose_name_plural = 'Custom Employee Names'