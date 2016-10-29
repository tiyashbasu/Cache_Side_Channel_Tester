from sys import argv
import matplotlib.pyplot as plt
import numpy as np


log_file = str(argv[1])
execs_per_trial = int(argv[2])
savefilename = str(argv[3])

time_sec = []
time_min = []
time_hr = []
temperature = []
objective = []
initial = []
acceptance = []
executions = []

data_file = open(log_file, "r")

data_line = data_file.readline().split(":")
time_sec.append(0)
time_min.append(0)
time_hr.append(0)
initial.append(int(data_line[1].strip()))
objective.append(int(data_line[1].strip()))
acceptance.append('nan')
executions.append(0)

for i in range(1, 4):
    data_file.readline()

count = 1
for line in data_file:
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
    if data_line[5].strip() == 'Y':
        acceptance.append(int(data_line[4].strip()))
    else:
        acceptance.append('nan')
    executions.append(execs_per_trial * count)
    count += 1
data_file.close()

ticks = np.arange(start=0, stop=execs_per_trial*count+1, step=execs_per_trial*10)

fig = plt.figure(figsize=(16, 9))

plt1 = fig.add_subplot(2, 1, 1)
plt1.set_title("Objective Values")
plt1.set_xlabel("Executions")
plt1.set_ylabel("Objective")
plt1.set_xticks(ticks)
plt1.grid(True)
plt1.plot(executions, objective, "b:", marker='.')
plt1.plot(executions, acceptance, "ro", label='Accepted Values')
plt1.plot(executions, initial, "go", label='Initial Random Objective')
plt1.legend(loc='lower right', numpoints=1, fontsize=10)
for i, val in enumerate(acceptance):
    plt1.annotate(val, (executions[i], acceptance[i]))
plt.margins(0, 0.1)
plt.setp(plt.xticks()[1], rotation=45, fontsize=10)
plt.setp(plt.yticks()[1], fontsize=10)

plt2 = fig.add_subplot(2, 1, 2)
plt2.set_title("Elapsed Time")
plt2.set_xlabel("Executions")
plt2.set_ylabel("Minutes")
plt2.set_xticks(ticks)
plt2.grid(True)
plt2.plot(executions, time_min)
plt.setp(plt.xticks()[1], rotation=45, fontsize=10)
plt.setp(plt.yticks()[1], fontsize=10)

fig.tight_layout()
plt.savefig(savefilename, bbox_inches="tight")
plt.show()
