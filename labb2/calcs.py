# Import Pandas and MatPlotLib
import pandas as pd
import matplotlib.pyplot as plt
import scipy.signal as scipy
plt.rcParams['figure.figsize'] = [8, 4]

# Import the data from google drive using Pandas
furuta_data = pd.read_csv('https://drive.google.com/uc?export=dowload&id=1h_f8h-EVbuwfANGVZn-6tRICi-tEaMli')

plt.figure(1)
plt.clf()
plt.plot(furuta_data.t, furuta_data.rotorPhi)
plt.title("Rotor angle")
plt.xlabel("time")
plt.ylabel("radians")

plt.figure(2)
plt.clf()
plt.plot(furuta_data.t, furuta_data.pendulumPhi)
plt.title("Pendulum angle")
plt.xlabel("time")
plt.ylabel("radians")

plt.figure(2)
plt.clf()
plt.plot(furuta_data.t, furuta_data.pendulumPhi)
plt.title("Pendulum angle")
plt.xlabel("time")
plt.ylabel("radians")
plt.show()