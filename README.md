# Spread of Disease Simulator (MATLAB)  
## A Martian Epidemiology Study Inspired by H.G. Wells

This project implements a simplified **agent-based disease spread model** in MATLAB. But here's the twist: it's framed as a fictional epidemiological study on **Martians**, inspired by H.G. Wells' *The War of the Worlds*.

It simulates how an unknown Earth-borne pathogen spreads through a closed Martian population over time. This makes it both a technically sound model of stochastic disease dynamics and a creative educational tool for exploring epidemic behavior in novel contexts.

## Overview

Each Martian is classified daily as:
- **NI**: Infected (in incubation)
- **NC**: Contagious (actively spreading)
- **NHI**: Healthy but Immune (recovered)
- **NH**: Healthy with No Immunity (vulnerable)

These states evolve based on random interactions, incubation durations, contagious periods, and immunity windows. Immunity fades with time, allowing reinfection—echoing themes of vulnerability and decay central to H.G. Wells' original narrative.

## Features

- Stochastic simulation using individual agent tracking
- Variable-length incubation, contagiousness, and immunity
- Immunity decay and reinfection possible
- Multiple simulation runs to visualize variability
- Visualizations and tables showing disease progression over time

## Martian Disease Model Parameters

```matlab
Results = SpreadOfDisease(N, a1, a2, b1, b2, c1, c2, DT_bar, NHo, NIo, NCo, NHIo, ND, NSIM)
