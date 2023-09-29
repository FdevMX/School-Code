import threading
def function(i):
    print ("function called by thread %i\n" %i)
    return

threads = []

for i in range(5):
    t = threading.Thread(target=function , args=(i,))
    threads.append(t)
    t.start()
    t.join()
    
git config --global user.email freddlopez261@gmail.com
git config --global user.name FreddMX
