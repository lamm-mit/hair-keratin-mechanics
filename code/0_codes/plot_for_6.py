import numpy as np
import matplotlib.pyplot as plt

data = np.genfromtxt("./collect_results/smd_resu.dat")
print(data.shape)
# data: step, x,y,z,SMD_Fx,SMD_Fy,SMD_Fz,SMD_Fn

# create figure and axis objects with subplots()
fig = plt.figure(figsize=(12,8),dpi=200)
fig, ax0 = plt.subplots()
# make a plot
ax0.plot(data[:,1],
        data[:,7],
        # color="red", 
        # marker=".",
        )
# set x-axis label
ax0.set_xlabel("x (Angstrom)", fontsize = 14)
# set y-axis label
ax0.set_ylabel("Fn (pN)",
            #   color="red",
              fontsize=14)
plt.savefig("./collect_results/SMDHist_x_Fn.jpg")