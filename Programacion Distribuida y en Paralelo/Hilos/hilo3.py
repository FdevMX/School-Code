import threading
import time

def first_function():
    print(threading.current_thread().name +\
        str(' is Starting \n'))
    time.sleep(2)
    print (threading.current_thread().name +\
        str(" is Exiting \n"))
    return
def second_function():
    print (threading.current_thread().name +\
        str (" is Starting \n"))
    time.sleep(2)
    print (threading.current_thread().name +\
        str (" is Exiting \n"))
    return
 
def third_function():
    print (threading.current_thread().name +\
        str (" is Starting \n"))
    time.sleep(2)
    print (threading.current_thread().name +\
        str (" is Exiting \n"))
    return

if __name__ == "__main__":
    t1 = threading.Thread(name='first_function', target=first_function)
    t2 = threading.Thread(name='second_function', target=second_function)
    t3 = threading.Thread(target=third_function)
    #t3 = threading.Thread(target=third_function)
    # se puede no asignarle un nombre
    t1.start()
    t2.start()
    t3.start()
    t1.join()
    t2.join()
    t3.join()