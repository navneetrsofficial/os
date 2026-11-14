alloc = [[0,1,0], [2,0,0], [3,0,2], [2,1,1], [0,0,2]]

max_need = [[7,5,3], [3,2,2], [9,0,2], [2,2,2], [4,3,3]]

avail = [3,3,2]

need = []

for i in range(5):
    need.append([max_need[i][j] - alloc[i][j] for j in range(3)])

finish = [False] * 5
safe = []

while len(safe) < 5:
    found = False

    for i in range(5):
        if not finish[i] and all(need[i][j] <= avail[j] for j in range(3)):
            for j in range(3):
                avail[j] += alloc[i][j]

            finish[i] = True
            safe.append("P" + str(i))
            found = True

    if not found:
        break

if len(safe) == 5:
    print("Safe Sequence:", safe)
else:
    print("Unsafe State")
