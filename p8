
def check_order(requests, order):
    last = -1

    for r in requests:
        if order.index(r) < last:
            print("Rejected:", requests, "- Order violated")
            return

        last = order.index(r)

    print("Accepted:", requests, "- Order maintained")


order = ["R1", "R2", "R3"]

processes = {
    "P1": ["R1", "R2"],
    "P2": ["R2", "R3"],
    "P3": ["R3", "R1"]
}

print("Fixed resource order:", " < ".join(order))

for p in processes:
    print(p, end=": ")
    check_order(processes[p], order)

#____________________________________________________________________________________________________________________
def check_resource_order(requests, resource_order): 
    rank = {resource: i for i, resource in enumerate(resource_order)} 
    last_rank = -1 
    for resource in requests: 
        if resource not in rank: 
            print("Rejected: Unknown resource", resource) 
 
            return False 
        if rank[resource] < last_rank: 
            print("Rejected:", requests, "- resource order violated at", resource) 
            return False 
        last_rank = rank[resource] 
    print("Accepted:", requests, "- order maintained") 
    return True 
  
if __name__ == "__main__": 
    resource_order = ["R1", "R2", "R3"] 
    print("Fixed resource order:", " < ".join(resource_order)) 
    check_resource_order(["R1", "R2"], resource_order) 
    check_resource_order(["R2", "R3"], resource_order) 
    check_resource_order(["R3", "R1"], resource_order)
