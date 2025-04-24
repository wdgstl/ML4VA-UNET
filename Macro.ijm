// Set input and output directories
inputDir = "/Users/wdgstl/UVA/czis/raw/";
outputDir = "/Users/wdgstl/UVA/czis/measurements/";
File.makeDirectory(outputDir);

// List all files in the input directory
list = getFileList(inputDir);

for (i = 0; i < list.length; i++) {
    filename = list[i];
    
    // Only process .CZI files
    if (endsWith(filename, ".czi")) {
        fullPath = inputDir + filename;
        print("Processing: " + filename);

        // Open image using Bio-Formats with Display ROIs enabled
        run("Bio-Formats Importer", "open=[" + fullPath + "] autoscale color_mode=Default rois_import=[ROI manager] display_rois view=Hyperstack stack_order=XYCZT");

        // Measure ROIs
        roiManager("Show All");
        roiManager("Measure");

        // Get base name without extension
        dotIndex = lastIndexOf(filename, ".");
        if (dotIndex != -1)
            baseName = substring(filename, 0, dotIndex);
        else
            baseName = filename;

        // Save results
        saveAs("Results", outputDir + baseName + "_measurements.csv");

        // Cleanup
        roiManager("Deselect");
        roiManager("Delete");
        close();
        run("Clear Results");
    }
}

print("Done. Results saved to: " + outputDir);
