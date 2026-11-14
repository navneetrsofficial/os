
processes = [212, 417, 112, 426]
blocks = [100, 500, 200, 300, 600]

# FIRST FIT
b = blocks.copy()
print("\nFIRST FIT")

for i in range(len(processes)):
    allocated = False

    for j in range(len(b)):
        if b[j] >= processes[i]:
            print("P", i+1, "-> B", j+1)
            b[j] -= processes[i]
            allocated = True
            break

    if not allocated:
        print("P", i+1, "-> Not Allocated")


# BEST FIT
b = blocks.copy()
print("\nBEST FIT")

for i in range(len(processes)):
    best = -1

    for j in range(len(b)):
        if b[j] >= processes[i]:
            if best == -1 or b[j] < b[best]:
                best = j

    if best != -1:
        print("P", i+1, "-> B", best+1)
        b[best] -= processes[i]
    else:
        print("P", i+1, "-> Not Allocated")


# WORST FIT
b = blocks.copy()
print("\nWORST FIT")

for i in range(len(processes)):
    worst = -1

    for j in range(len(b)):
        if b[j] >= processes[i]:
            if worst == -1 or b[j] > b[worst]:
                worst = j

    if worst != -1:
        print("P", i+1, "-> B", worst+1)
        b[worst] -= processes[i]
    else:
        print("P", i+1, "-> Not Allocated")
