import threading
import logging

print("Alfredo Lopez Mendez 4o M\n")

logging.basicConfig(level=logging.DEBUG,
                    format='(%(threadName)-10s) %(message)s',)

def threading_with(statement):
    with statement:
        logging.debug('%s acquired via with' % statement)

def threading_not_with(statement):
    statement.acquire()
    try:
        logging.debug('%s acquired directly' % statement)
    finally:
        statement.release()

if __name__ == '__main__':
    # Let's create a test battery
    lock = threading.Lock()
    rlock = threading.RLock()
    condition = threading.Condition()
    mutex = threading.Semaphore(1)
    
    threading_synchronization_list = [lock, rlock, condition, mutex]
    
    # In the for loop, we call the threading_with and threading_not_with functions
    for statement in threading_synchronization_list:
        t1 = threading.Thread(target=threading_with, args=(statement,))
        t2 = threading.Thread(target=threading_not_with, args=(statement,))
        t1.start()
        t2.start()
        t1.join()
        t2.join()