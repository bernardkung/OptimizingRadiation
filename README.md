# Optimizing Radiation Therapy
OR7245 Network Analysis and Advanced Optimization  
Spring 2017  

Bernard Kung  
Parth Vadera  


### Introduction
High doses of radiation can kill cells or prevent them from growing and dividing. Radiation therapy is attractive as a cancer treatment since the repair mechanisms for cancer cells are less efficient than for normal cells. Radiation therapy uses a machine to deliver large doses of radiation beamed from different angles into the target region of a body. However, a beam of radiation dissipates as it basses through a target region. By using multiple beams at different angles, a large dose can be delivered over the intersecting beam paths. Furthermore, a target region is likely to contain not only a tumorous area, but critical areas where only little to no radiation is allowed. The goal is to build a linear program to optimize the selection and intensity of pre-determined beamlets to deliver a high radiation dosage over tumorous areas, and limited radiation dosage over critical areas.

### Project Details
This project presents 5 model formulations of different scenarios:
1. The base model maximizes the difference between radiation dosage in tumorous areas versus critical areas, given the following constraints:  
    a. A maximum limit on critical area radiation dosage.  
    b. A minimum limit on tumor area radiation dosage.  
    c. A maximum limit on intensity of each beamlet.   
2. Lagrangian relaxation model; the above constraints may make the problem infeasible, so instead this model heavily penalizes violating a constraint.
3. Borger region model. This model addresses inaccuracies in imaging, and defines border regions around critical areas as a sort of second-tier critical area. 
4. Shared intensity model. Previously, each beamlet was constrained at a maximum level; this additionally constrains the sum of beamlet intensities.
5. Multi-capacity shared intensity model. Using the shared intensity model, now each individual beamlet has an individual maximum beamlet intensity.

Each model formulation is written in AMPL and demonstrated on a small and large example.

### Files
#### Part 1:
##### Small Example:
small.dat  
part1.mod  
small1.run  

##### Actual Example:
actual.dat  
part1.mod  
actual1.run  

#### Part 2:
##### Small Example:
small.dat  
part2.mod  
small2.run  

##### Actual Example:
actual.dat  
part2.mod  
actual2.run  

#### Part 3:
##### Small Example:
small.dat  
part3.mod  
small3.run  

##### Actual Example:
actual.dat  
part3.mod  
actual3.run  

#### Part 4:
##### Small Example:
small.dat  
part4.mod  
small4.run  

##### Actual Example:
actual.dat  
part4.mod  
actual4.run  

#### Part 5:
##### Small Example:
small5.dat  
part5.mod  
small5.run  

##### Actual Example:
actual5.dat  
part5.mod  
actual5.run  
