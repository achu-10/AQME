from django.shortcuts import render
from django.http import HttpResponseRedirect
import MySQLdb
import requests
from django.core.files.storage import FileSystemStorage

con=MySQLdb.connect("localhost","root","","Gas")
c=con.cursor()
import firebase_admin
from firebase_admin import credentials 

def userregistration(request):
    if request.POST :
        name=request.POST.get("t1")
        email=request.POST.get("t2")
        location=request.POST.get("t3")
        phone=request.POST.get("t4")
        dob=request.POST.get("t5")
        password=request.POST.get("t6")
        role="user"
        qry1="insert into registration (name,email,location,phone,dob) values('"+name+"','"+email+"','"+location+"','"+phone+"','"+dob+"')"
        qry2="insert into login values('"+email+"','"+password+"','"+role+"')"
        c.execute(qry1)
        c.execute(qry2)
        con.commit()
    return render(request,"userregistration.html")
def login(request):
    msg=""
    if request.POST :
        uname=request.POST.get("t1")
        password=request.POST.get("t2")
        qry="select role from login where username='"+uname+"' and password='"+password+"'"
        print(qry)
        c.execute(qry)
        data=c.fetchone()
        request.session["uname"]=uname
        
        if(data[0]=="user"):
            return HttpResponseRedirect("/searchbus")
        elif(data[0].lower()=="admin"):
            return HttpResponseRedirect("/registration")
      
        else:
            msg="invalid username or password"

    return render(request,"login.html",{"data":msg})
def viewusers(request):
    qry="select * from registration"
    c.execute(qry)
    data=c.fetchall()
    
    return render(request,"viewusers.html",{"data":data})

def searchbus(request):
    from firebase import firebase 
    fb_app = firebase.FirebaseApplication('https://gas-lekage-detection-default-rtdb.firebaseio.com/', None)
    #get data from the firebase and stored on result
    result = fb_app.get('/', None)
    print(result)
    alert=result["Alert"]
    gas=result["gas"]
    hum=result["hum"]
    temp=result["temp"]
    from datetime import date
    dat=date.today()
    c.execute("insert into data(gas,temp,hum,date) values('"+str(gas)+"','"+str(temp)+"','"+str(hum)+"','"+str(dat)+"')")
    con.commit()
    c.execute("select * from data")
    data=c.fetchall()


    
        
    
    return render(request,"searchbus.html",{"result":data,"Alert":alert})
def graph(request):
    c.execute("select * from data")
    data=c.fetchall()
    l=[]
    l1=[]
    for d in data:
       
        l.append(d[1])
        l1.append(d[0])

    return render(request,"graph.html",{"l":l,"l1":l1})
def graph2(request):
    c.execute("select * from data")
    data=c.fetchall()
    l=[]
    l1=[]
    for d in data:
       
        l.append(d[2])
        l1.append(d[0])

    return render(request,"graph2.html",{"l":l,"l1":l1})
def graph3(request):
    c.execute("select * from data")
    data=c.fetchall()
    l=[]
    l1=[]
    for d in data:
       
        l.append(d[3])
        l1.append(d[0])

    return render(request,"graph3.html",{"l":l,"l1":l1})

