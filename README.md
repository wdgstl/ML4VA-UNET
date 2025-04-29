# ML4VA: Atherosclerotic Lesion Quantification

This repository contains code and macros for preprocessing, quantifying, and analyzing atherosclerotic plaque burden in histological images of mouse aortas.

## Files Overview

- **AtheroDataProcessing.ipynb**  
  Main Jupyter notebook used for cleaning, organizing, and preparing raw measurements for analysis.

- **measurements_processing.ipynb**  
  A secondary notebook used to process CSV outputs from ImageJ ROI measurements, extract lesion area, and perform calculations such as mean lesion size.

- **Macro.ijm**  
  An ImageJ macro that automates the ROI-based measurement process for `.czi` histology files using the Bio-Formats importer. Make sure ROI Manager is enabled when running.


