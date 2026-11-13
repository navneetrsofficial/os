
import multiprocessing
import time

def work(i, s):
    s.acquire()
    print("Process", i, "accessing resource")
    time.sleep(1)
    print("Process", i, "finished")
    s.release()

if __name__ == "__main__":
    s = multiprocessing.Semaphore(2)
    p = []

    for i in range(1, 6):
        x = multiprocessing.Process(target=work, args=(i, s))
        p.append(x)
        x.start()

    for x in p:
        x.join()

    print("All processes completed")
