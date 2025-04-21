# Spread of Disease Simulator (MATLAB)

This project implements a simplified **agent-based model** of disease transmission using MATLAB. It simulates the spread of an infection through a population over a fixed number of days and across multiple simulation runs. Each agent in the population has individual health status and interacts randomly with others, allowing for realistic, emergent patterns of disease progression.

## Overview

The simulation categorizes individuals into four groups:
- **NI**: Infected (incubating, not yet contagious)
- **NC**: Contagious (actively spreading the disease)
- **NHI**: Healthy but immune (recovered)
- **NH**: Healthy and not immune

Over time, individuals transition between states based on incubation, contagiousness, and immunity periods defined using random intervals. The model assumes random daily interactions between agents and simulates disease transmission accordingly.

## Features

- Stochastic simulation with individual-level tracking
- Incubation and recuperation periods vary per person
- Immunity wanes over time, allowing reinfection
- Multiple simulation runs for statistical robustness

## Parameters

The function takes the following input arguments:

```matlab
Results = SpreadOfDisease(N, a1, a2, b1, b2, c1, c2, DT_bar, NHo, NIo, NCo, NHIo, ND, NSIM)
