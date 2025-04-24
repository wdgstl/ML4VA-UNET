inputDir = "/Users/wdgstl/UVA/czis/raw/";
outputDir = "/Users/wdgstl/UVA/czis/measurements/";
File.makeDirectory(outputDir);

list = getFileList(inputDir);

for (i = 0; i < list.length; i++) {
    filename = list[i];
    if (endsWith(filename, ".czi")) {
        fullPath = inputDir + filename;
        print("Processing: " + filename);
        run("Bio-Formats Importer", "open=[" + fullPath + "] autoscale color_mode=Default rois_import=[ROI manager] display_rois view=Hyperstack stack_order=XYCZT");
        roiManager("Show All");
        roiManager("Measure");
        dotIndex = lastIndexOf(filename, ".");
        if (dotIndex != -1)
            baseName = substring(filename, 0, dotIndex);
        else
            baseName = filename;

        saveAs("Results", outputDir + baseName + "_measurements.csv");
        roiManager("Deselect");
        roiManager("Delete");
        close();
        run("Clear Results");
    }
}

print("Done. Results saved to: " + outputDir);
