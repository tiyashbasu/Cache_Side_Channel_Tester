from sys import argv
import matplotlib.pyplot as plt
import numpy as np

if len(argv) == 1:
    print("Incorrect usage.")
    print("Usage: graph_generator.py <log file name> <all results file name> <executions per trial> <output figure filename>")
    quit()

log_filename = str(argv[1])
allresults_filename = str(argv[2])
execs_per_trial = int(argv[3])
savefig_filename = str(argv[4])

time_sec = []
time_min = []
time_hr = []
temperature = []
objective = []
total_vals = []
allresults = set()
initial = []
acceptance = []
executions = []

def update_total_vals():
    i = 0
    while (i < execs_per_trial):
        i += 1
        line_split = allresults_file.readline().split('\t')
        if len(line_split) < 2:
            continue
        val = int((line_split[len(line_split) - 1]).strip())
        allresults.add(val)
    total_vals.append(len(allresults))

log_file = open(log_filename, "r")
allresults_file = open(allresults_filename, "r")

data_line = log_file.readline().split(":")
time_sec.append(0)
time_min.append(0)
time_hr.append(0)
initial.append(int(data_line[1].strip()))
objective.append(int(data_line[1].strip()))
update_total_vals()
acceptance.append(objective[0])
executions.append(0)

for i in range(1, 4):
    log_file.readline()

count = 1
for line in log_file:
    data_line = line.split("\t")
    if len(data_line) != 6:
        break
    time_str = data_line[0].strip().split(":")
    seconds = float(time_str[0]) * 3600 + float(time_str[1]) * 60 + float(time_str[2])
    time_sec.append(seconds)
    time_min.append(seconds / 60)
    time_hr.append(seconds / 3600)
    temperature.append(float(data_line[1].strip()))
    initial.append('nan')
    if count == 1:
        temperature.append(float(data_line[1].strip()))
    objective.append(int(data_line[4].strip()))
    update_total_vals()
    if data_line[5].strip() == 'Y':
        acceptance.append(objective[count])
    else:
        acceptance.append(acceptance[count - 1])
    executions.append(execs_per_trial * count)
    count += 1
log_file.close()
allresults_file.close()

ticks = np.arange(start=0, stop=execs_per_trial*count+1, step=execs_per_trial*10)

fig = plt.figure(figsize=(16, 9))

plt1 = fig.add_subplot(2, 1, 1)
plt1.set_title("Number of Tests with Unique Misses")
plt1.set_xlabel("Total number of executions")
plt1.set_ylabel("Number of tests with unique misses")
plt1.set_xticks(ticks)
plt1.grid(True)
labelstr = "Unique misses in last " + str(execs_per_trial) + " executions"
plt1.plot(executions, acceptance, "b-", label=labelstr)
plt1.plot(executions, total_vals, "r-", label="Unique misses in all executions")
plt1.plot(executions, objective, "b:", alpha=0.6)
plt.legend(loc='lower right', fontsize=10)
plt.margins(0, 0.1)
plt.setp(plt.xticks()[1], rotation=45, fontsize=10)
plt.setp(plt.yticks()[1], fontsize=10)

plt2 = fig.add_subplot(2, 1, 2)
plt2.set_title("Elapsed Time")
plt2.set_xlabel("Total number of executions")
plt2.set_ylabel("Time (in minutes)")
plt2.set_xticks(ticks)
plt2.grid(True)
plt2.plot(executions, time_min)
plt.setp(plt.xticks()[1], rotation=45, fontsize=10)
plt.setp(plt.yticks()[1], fontsize=10)

fig.tight_layout()
plt.savefig(savefig_filename, bbox_inches="tight")
#plt.show()
